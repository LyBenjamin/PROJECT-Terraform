terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.11"
    }
  }
}
provider "proxmox" {
  pm_api_url = var.proxmox_api_url
  pm_user    = var.proxmox_user
  pm_password = var.proxmox_password
  pm_tls_insecure = true
  pm_timeout = 600
}

resource "proxmox_vm_qemu" "static_vm" {
  name        = var.hostname
  target_node = var.target_node
  vmid        = var.vm_id

  clone       = var.template_name
  os_type     = "cloud-init"
  full_clone  = true

  cores       = 2
  memory      = 2048
  sockets     = 1

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  disk {
    size = "10G"
    type = "scsi"
    storage = "local-lvm"
    iothread = 1
  }

  ipconfig0 = "ip=${var.ip_address},gw=${var.gateway}"

  ciuser     = "ubuntu"
  cipassword = "ubuntu123"

}
