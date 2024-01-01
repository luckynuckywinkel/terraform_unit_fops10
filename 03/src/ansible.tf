resource "local_file" "inventory" {
  filename = "${path.module}/inventory"
  content = <<-EOT
    [webservers]
    web-1 ansible_host = "${yandex_compute_instance.web[0].network_interface[0].nat_ip_address}" fqdn = "${yandex_compute_instance.web[0].name}.${yandex_compute_instance.web[0].zone}.internal"
    web-2 ansible_host = "${yandex_compute_instance.web[1].network_interface[0].nat_ip_address}" fqdn = "${yandex_compute_instance.web[1].name}.${yandex_compute_instance.web[1].zone}.internal"

    [databases]
    main ansible_host = "${yandex_compute_instance.db["main"].network_interface[0].nat_ip_address}" fqdn = "${yandex_compute_instance.db["main"].name}.${yandex_compute_instance.db["main"].zone}.internal"
    replica ansible_host = "${yandex_compute_instance.db["replica"].network_interface[0].nat_ip_address}" fqdn = "${yandex_compute_instance.db["replica"].name}.${yandex_compute_instance.db["replica"].zone}.internal"

    [storage]
    storage ansible_host = "${yandex_compute_instance.storage.network_interface[0].nat_ip_address}" fqdn = "${yandex_compute_instance.storage.name}.${yandex_compute_instance.storage.zone}.internal"
  EOT
}



