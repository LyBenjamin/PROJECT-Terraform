proxmox_api_url  = "https://82.96.142.195:28006/api2/json"
proxmox_user     = "root@pam"
proxmox_password = "PROXMOX_01!"
target_node      = "PROXMOX-01"
template_name    = "ubuntu-22-template"
template_vm_id   = 9000

# VM 1 (renommée)
vm_id      = 101
hostname   = "srv-apache-front"
ip_address = "192.168.10.217/24"
gateway    = "192.168.10.254"

# VM 2 (nouvelle)
vm_id_bdd      = 103
hostname_bdd   = "srv-mango-bdd"
ip_address_bdd = "192.168.10.218/24"

