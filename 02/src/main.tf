resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_family
}
resource "yandex_compute_instance" "platform" {
  name        = local.vm_web_name
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vms_web_resources["cores"]
    memory        = var.vms_web_resources["memory"]
    core_fraction = var.vms_web_resources["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vms_ssh["port_enable"]
    ssh-keys           = "ubuntu:${var.vms_ssh["ssh_key"]}"
  }

}
data "yandex_compute_image" "ubuntu2" {
   family = var.vm_db_image_family
 }

resource "yandex_compute_instance" "database" {
  name        = local.vm_db_name
  platform_id = var.vm_db_platform_id
  allow_stopping_for_update = true
  resources {
    cores         = var.vms_db_resources["cores"]
    memory        = var.vms_db_resources["memory"]
    core_fraction = var.vms_db_resources["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu2.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  metadata = {
    serial-port-enable = var.vms_ssh["port_enable"]
    ssh-keys           = "ubuntu:${var.vms_ssh["ssh_key"]}"
  }
}
