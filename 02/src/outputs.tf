output "web_instance_info" {
  value = {
    instance_name = yandex_compute_instance.platform.name
    external_ip   = yandex_compute_instance.platform.network_interface.0.nat_ip_address
  }
}

output "db_instance_info" {
  value = {
    instance_name = yandex_compute_instance.database.name
    external_ip   = yandex_compute_instance.database.network_interface.0.nat_ip_address
  }
}

