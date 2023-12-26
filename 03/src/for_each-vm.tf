variable "each_vm" {
  type = map(object({
    cpu           = number
    ram           = number
    core_fraction = number
    disk          = number
  }))
  default = {
    main = {
      cpu           = 4
      ram           = 8
      core_fraction = 100
      disk          = 50
    },
    replica = {
      cpu           = 2
      ram           = 4
      core_fraction = 50
      disk          = 50
    },
  }
}

resource "yandex_compute_instance" "db" {
  for_each = var.each_vm

  name = each.key

  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id   = data.yandex_compute_image.ubuntu.image_id
      size  = each.value.disk
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

