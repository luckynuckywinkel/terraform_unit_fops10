variable "vms_web_resources" {
  type = map(string)
  default = {
    cores          = 2
    memory         = 1
    core_fraction  = 20
  }
}

variable "vms_storage_resources" {
  type = map(string)
  default = {
    cores          = 2
    memory         = 2
    core_fraction  = 50
  }
}


variable "vms_ssh" {
  type = map(any)
  default = {
    port_enable                 = "1"
    ssh_key                     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINDmtCbX1Vs0GJpuoGXzTk0CE14wgN1YwriLxmrJENEV root@terrhost"
  }
}
