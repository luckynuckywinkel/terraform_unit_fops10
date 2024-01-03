#resource "local_file" "inventory" {
#  filename = "${path.module}/inventory"
#  content = <<-EOT
#    [webservers]
#    web-1 ansible_host = "${yandex_compute_instance.web[0].network_interface[0].nat_ip_address}" fqdn = "${yandex_compute_instance.web[0].name}.${yandex_compute_instance.web[0].zone}.internal"
#    web-2 ansible_host = "${yandex_compute_instance.web[1].network_interface[0].nat_ip_address}" fqdn = "${yandex_compute_instance.web[1].name}.${yandex_compute_instance.web[1].zone}.internal"

#    [databases]
#    main ansible_host = "${yandex_compute_instance.db["main"].network_interface[0].nat_ip_address}" fqdn = "${yandex_compute_instance.db["main"].name}.${yandex_compute_instance.db["main"].zone}.internal"
#    replica ansible_host = "${yandex_compute_instance.db["replica"].network_interface[0].nat_ip_address}" fqdn = "${yandex_compute_instance.db["replica"].name}.${yandex_compute_instance.db["replica"].zone}.internal"

#    [storage]
#    storage ansible_host = "${yandex_compute_instance.storage.network_interface[0].nat_ip_address}" fqdn = "${yandex_compute_instance.storage.name}.${yandex_compute_instance.storage.zone}.internal"
#  EOT
#}


#locals {
#  webservers = yandex_compute_instance.web
#  databases  = yandex_compute_instance.db
#  storage    = yandex_compute_instance.storage
#}

#resource "local_file" "inventory" {
#  filename = "${abspath(path.module)}/inventory.cfg"

#  content = templatefile("${path.module}/inventory.tftpl", {
#    webservers = local.webservers
#    databases  = local.databases
#    storage    = local.storage
#  })

#depends_on = [
#    yandex_compute_instance.web,
#    yandex_compute_instance.db,
#    yandex_compute_instance.storage,
#  ]
#}

#resource "null_resource" "gather_ip" {
#  depends_on = [
#    yandex_compute_instance.web,
#    yandex_compute_instance.db,
#    yandex_compute_instance.storage,
#  ]
#  provisioner "local-exec" {
#        command = "sleep 30"
#  }

#  provisioner "local-exec" {
#    command = <<EOT
#      cat > inventory.cfg <<EOF
#      [webservers]
#      %{ for instance in yandex_compute_instance.web ~}
#      ${instance.name} ansible_host=${instance.network_interface[0].nat_ip_address} fqdn=${instance.name}.${instance.zone}.internal
#      %{ endfor ~}

#      [databases]
#      %{ for instance in yandex_compute_instance.db ~}
#      ${instance.name} ansible_host=${instance.network_interface[0].nat_ip_address} fqdn=${instance.name}.${instance.zone}.internal
#      %{ endfor ~}

#      [storage]
#      %{ for instance in yandex_compute_instance.storage ~}
#      ${instance.name} ansible_host=${instance.network_interface[0].nat_ip_address} fqdn=${instance.name}.${instance.zone}.internal
#      %{ endfor ~}
#      EOF
#    EOT
#  }
#}

resource "local_file" "hosts_cfg" {
  filename = "./hosts.cfg"
  content = templatefile("./inventory.tftpl", {
    webservers = yandex_compute_instance.web,
    databases  = yandex_compute_instance.db,
    storage    = [yandex_compute_instance.storage]
  })
}



