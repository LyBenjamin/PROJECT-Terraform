terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.50.0"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox_api_url
  username = var.proxmox_user
  password = var.proxmox_password
  insecure = true
}

# ===== VM 1 : renommée en srv-apache-front (VMID 101) =====
resource "proxmox_virtual_environment_vm" "static_vm" {
  name      = var.hostname                  # "srv-apache-front"
  node_name = var.target_node
  vm_id     = var.vm_id

  clone {
    vm_id = var.template_vm_id
    full  = true
  }

  cpu {
    cores   = 2
    sockets = 1
  }

  memory {
    dedicated = 2048
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  disk {
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = 10
    file_format  = "raw"
  }

  initialization {
    ip_config {
      ipv4 {
        address = var.ip_address
        gateway = var.gateway
      }
    }
    user_account {
      username = "ubuntu"
      password = "ubuntu123"
    }
  }
}

# ===== VM 2 : nouvelle srv-mango-bdd (VMID 103, IP .218) =====
resource "proxmox_virtual_environment_vm" "srv_mango_bdd" {
  name      = var.hostname_bdd              # "srv-mango-bdd"
  node_name = var.target_node
  vm_id     = var.vm_id_bdd

  clone {
    vm_id = var.template_vm_id
    full  = true
  }

  cpu {
    cores   = 2
    sockets = 1
  }

  memory {
    dedicated = 2048
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  disk {
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = 10
    file_format  = "raw"
  }

  initialization {
    ip_config {
      ipv4 {
        address = var.ip_address_bdd
        gateway = var.gateway
      }
    }
    user_account {
      username = "ubuntu"
      password = "ubuntu123"
    }
  }
}

