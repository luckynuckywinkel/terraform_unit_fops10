resource "yandex_compute_disk" "my_disk" {
  count = 3
  name  = "my-disk-${count.index + 1}"
  size  = 1
}

resource "yandex_compute_instance" "storage" {
  name = "storage"
  platform_id = var.vm_storage_platform_id

  resources {
    cores         = var.vms_storage_resources["cores"]
    memory        = var.vms_storage_resources["memory"]
    core_fraction = var.vms_storage_resources["core_fraction"]
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.my_disk
    content {
      disk_id = secondary_disk.value.id
    }
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

