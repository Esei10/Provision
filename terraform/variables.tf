# PROXMOX SETUP VARS # 
variable "proxmox_url" {
  sensitive = true
}
variable "proxmox_api_token" {
  # In password manager
  sensitive = true
}

# FREEIPA #
variable "root_domain" {
  sensitive = true
}
variable "ipa_url" {
  sensitive = true
}
variable "ipa_user" {
  default = "terraformuser"
}
variable "ipa_password" {
  # In password manager
  sensitive = true
}

# PROXMOX WORK VARS #
variable "virtual_environment_node_name" {
  default = "nhv"
}
variable "debian_template_id" {
  default = "9001"
}
variable "ram_per_node" {
  default = "8192" # 8 GB
}
variable "ram_per_master_node" {
  default = "4096" # 4 GB
}
variable "kube_ip_prefix" {
  sensitive = true
}
variable "dns_server" {
  sensitive = true
}

