output "servers" {
  value = [[for server in yandex_compute_instance.web:{fqdn = server.fqdn, id = server.id, name = server.name }],
           [for server in yandex_compute_instance.db:{fqdn = server.fqdn, id = server.id, name = server.name }],
           [for server in [yandex_compute_instance.storage]:{fqdn = server.fqdn, id = server.id, name = server.name }]]
}
