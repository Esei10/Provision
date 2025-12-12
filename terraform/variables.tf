# PROXMOX SETUP VARS # 
variable "proxmox_url" {
  default = "https://nhv.home.agent-est.com:8006/"
}
variable "proxmox_api_token" {
  # In password manager
  sensitive = true
}

# FREEIPA #
variable "ipa_url" {
  default = "ipa.home.agent-est.com"
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
  default = "4096" # 4 GB
}
