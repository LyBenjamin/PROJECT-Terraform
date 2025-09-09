variable "proxmox_api_url" {
  description = "URL de l'API Proxmox"
  type        = string
}

variable "proxmox_user" {
  description = "Nom d'utilisateur Proxmox"
  type        = string
}

variable "proxmox_password" {
  description = "Mot de passe Proxmox"
  type        = string
  sensitive   = true
}

variable "target_node" {
  description = "Noeud Proxmox cible"
  type        = string
}

# Gardé pour compatibilité mais non utilisé avec le provider BPG
variable "template_name" {
  description = "Nom du template (non utilisé avec BPG)"
  type        = string
  default     = ""
}

variable "vm_id" {
  description = "ID de la VM"
  type        = number
}

variable "hostname" {
  description = "Nom de la VM"
  type        = string
}

variable "ip_address" {
  description = "Adresse IP de la VM en CIDR (ex: 192.168.10.217/24)"
  type        = string
}

variable "gateway" {
  description = "Passerelle réseau"
  type        = string
}

variable "template_vm_id" {
  description = "ID numérique du template VM"
  type        = number
  default     = 9000
}

# ======= NEW (pour la VM BDD) =======
variable "vm_id_bdd" {
  description = "ID de la VM BDD"
  type        = number
}

variable "hostname_bdd" {
  description = "Nom de la VM BDD"
  type        = string
}

variable "ip_address_bdd" {
  description = "Adresse IP de la VM BDD en CIDR (ex: 192.168.10.218/24)"
  type        = string
}

