data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_family

}
resource "yandex_compute_instance" "web" {
  count = 2
  name  = "web-${count.index + 1}"
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

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
  
  #security_group_ids = [yandex_vpc_security_group.example.id]

  metadata = {
    serial-port-enable = var.vms_ssh["port_enable"]
    ssh-keys           = "ubuntu:${var.vms_ssh["ssh_key"]}"
   # security-group-id  = "enpv1pre7gv26up4rrtm"   
  }

  depends_on = [
    yandex_compute_instance.db
  ]
}

