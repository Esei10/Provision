terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.87.0"
    }
    freeipa = {
      source  = "rework-space-com/freeipa"
      version = "5.2.0"
    }
  }
}

provider "proxmox" {
  endpoint  = var.proxmox_url
  api_token = var.proxmox_api_token
  insecure  = true
  ssh {
    username = "terraformuser"
    password = var.ipa_password
  }
}

provider "freeipa" {
  host           = var.ipa_url
  username       = var.ipa_user
  password       = var.ipa_password
  ca_certificate = "/var/lib/ipa-client/pki/ca-bundle.pem"
}
