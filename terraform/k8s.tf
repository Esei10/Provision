data "local_file" "ssh_public_key" {
  filename = "resources/ssh.pub"
}

resource "proxmox_virtual_environment_file" "user_data_cloud_config" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = var.virtual_environment_node_name

  source_raw {
    data = <<-EOF
    #cloud-config
    users:
      - default
      - name: root
        shell: /bin/bash
        ssh_authorized_keys:
          - ${trimspace(data.local_file.ssh_public_key.content)}
    package_update: true
    packages:
      - qemu-guest-agent
    runcmd:
      - systemctl enable qemu-guest-agent
      - systemctl start qemu-guest-agent
    EOF

    file_name = "user-data-cloud-config.yaml"
  }
}

resource "proxmox_virtual_environment_download_file" "debian13_cloudinit" {
  content_type       = "import"
  datastore_id       = "local"
  file_name          = "debian13.qcow2"
  node_name          = var.virtual_environment_node_name
  url                = "https://cloud.debian.org/images/cloud/trixie/latest/debian-13-generic-amd64.qcow2"
}

resource "proxmox_virtual_environment_vm" "kube-MASTER" {
  name        = "kube-MASTER"
  description = "Managed by Terraform"
  node_name   = var.virtual_environment_node_name
  vm_id       = "200"

  agent {
    enabled = true
  }

  memory {
    dedicated = var.ram_per_master_node
    floating  = var.ram_per_master_node
  }

  disk {
    datastore_id = "local"
    file_id      = proxmox_virtual_environment_download_file.debian13_cloudinit.id
    interface    = "scsi0"
    size         = "30"
  }

  efi_disk {
    datastore_id = "local"
    type         = "4m"
  }

  tpm_state {
    datastore_id = "local"
  }

  cpu {
    cores = 8
    type  = "x86-64-v2-AES"
  }

  machine = "q35"
  bios    = "ovmf"

  network_device {
    bridge = "cluster"
  }

  operating_system {
    type = "l26"
  }

  serial_device {
    device = "socket"
  }



  initialization {
    datastore_id = "local"
    dns {
      domain  = var.root_domain
      servers = [var.dns_server]
    }
    ip_config {
      ipv4 {
        address = "${var.kube_ip_prefix}.200/24"
        gateway = "${var.kube_ip_prefix}.1"
      }
    }

    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id

  }
}

resource "proxmox_virtual_environment_vm" "kube-MASTER2" {
  name        = "kube-MASTER2"
  description = "Managed by Terraform"
  node_name   = var.virtual_environment_node_name
  vm_id       = "201"

  agent {
    enabled = true
  }

  memory {
    dedicated = var.ram_per_master_node
    floating  = var.ram_per_master_node
  }

  disk {
    datastore_id = "local"
    file_id      = proxmox_virtual_environment_download_file.debian13_cloudinit.id
    interface    = "scsi0"
    size         = "30"
  }

  efi_disk {
    datastore_id = "local"
    type         = "4m"
  }

  tpm_state {
    datastore_id = "local"
  }

  cpu {
    cores = 8
    type  = "x86-64-v2-AES"
  }

  machine = "q35"
  bios    = "ovmf"

  network_device {
    bridge = "cluster"
  }

  operating_system {
    type = "l26"
  }

  serial_device {
    device = "socket"
  }



  initialization {
    datastore_id = "local"
    dns {
      domain  = var.root_domain
      servers = [var.dns_server]
    }
    ip_config {
      ipv4 {
        address = "${var.kube_ip_prefix}.201/24"
        gateway = "${var.kube_ip_prefix}.1"
      }
    }

    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id

  }
}

resource "proxmox_virtual_environment_vm" "kube-MASTER3" {
  name        = "kube-MASTER3"
  description = "Managed by Terraform"
  node_name   = var.virtual_environment_node_name
  vm_id       = "202"

  agent {
    enabled = true
  }

  memory {
    dedicated = var.ram_per_master_node
    floating  = var.ram_per_master_node
  }

  disk {
    datastore_id = "local"
    file_id      = proxmox_virtual_environment_download_file.debian13_cloudinit.id
    interface    = "scsi0"
    size         = "30"
  }

  efi_disk {
    datastore_id = "local"
    type         = "4m"
  }

  tpm_state {
    datastore_id = "local"
  }

  cpu {
    cores = 8
    type  = "x86-64-v2-AES"
  }

  machine = "q35"
  bios    = "ovmf"

  network_device {
    bridge = "cluster"
  }

  operating_system {
    type = "l26"
  }

  serial_device {
    device = "socket"
  }



  initialization {
    datastore_id = "local"
    dns {
      domain  = var.root_domain
      servers = [var.dns_server]
    }
    ip_config {
      ipv4 {
        address = "${var.kube_ip_prefix}.202/24"
        gateway = "${var.kube_ip_prefix}.1"
      }
    }

    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id

  }
}

resource "proxmox_virtual_environment_vm" "kube-WORKER1" {
  name        = "kube-WORKER1"
  description = "Managed by Terraform"
  node_name   = var.virtual_environment_node_name
  vm_id       = "203"

  agent {
    enabled = true
  }

  memory {
    dedicated = var.ram_per_node
    floating  = var.ram_per_node
  }

  disk {
    datastore_id = "local"
    interface    = "scsi0"
    file_id      = proxmox_virtual_environment_download_file.debian13_cloudinit.id
    size         = "30"
  }
  
  disk {
    datastore_id = "local"
    interface    = "scsi1"
    size         = "40"
    file_format  = "qcow2"
  }

  efi_disk {
    datastore_id = "local"
    type         = "4m"
  }

  tpm_state {
    datastore_id = "local"
  }

  cpu {
    cores = 8
    type  = "x86-64-v2-AES"
  }

  machine = "q35"
  bios    = "ovmf"

  network_device {
    bridge = "cluster"
  }

  operating_system {
    type = "l26"
  }

  serial_device {
    device = "socket"
  }



  initialization {
    datastore_id = "local"
    dns {
      domain  = var.root_domain
      servers = [var.dns_server]
    }
    ip_config {
      ipv4 {
        address = "${var.kube_ip_prefix}.203/24"
        gateway = "${var.kube_ip_prefix}.1"
      }
    }

    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id

  }
}

resource "proxmox_virtual_environment_vm" "kube-WORKER2" {
  name        = "kube-WORKER2"
  description = "Managed by Terraform"
  node_name   = var.virtual_environment_node_name
  vm_id       = "204"

  agent {
    enabled = true
  }

  memory {
    dedicated = var.ram_per_node
    floating  = var.ram_per_node
  }

  disk {
    datastore_id = "local" 
    file_id      = proxmox_virtual_environment_download_file.debian13_cloudinit.id
    interface    = "scsi0"
    size         = "30"
  }

  disk {
    datastore_id = "local"
    interface    = "scsi1"
    size         = "40"
    file_format  = "qcow2"
  }

  efi_disk {
    datastore_id = "local"
    type         = "4m"
  }

  tpm_state {
    datastore_id = "local"
  }

  cpu {
    cores = 8
    type  = "x86-64-v2-AES"
  }

  machine = "q35"
  bios    = "ovmf"

  network_device {
    bridge = "cluster"
  }

  operating_system {
    type = "l26"
  }

  serial_device {
    device = "socket"
  }



  initialization {
    datastore_id = "local"
    dns {
      domain  = var.root_domain
      servers = [var.dns_server]
    }
    ip_config {
      ipv4 {
        address = "${var.kube_ip_prefix}.204/24"
        gateway = "${var.kube_ip_prefix}.1"
      }
    }

    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id

  }
}

resource "proxmox_virtual_environment_vm" "kube-WORKER3" {
  name        = "kube-WORKER3"
  description = "Managed by Terraform"
  node_name   = var.virtual_environment_node_name
  vm_id       = "205"

  agent {
    enabled = true
  }

  memory {
    dedicated = var.ram_per_node
    floating  = var.ram_per_node
  }

  disk {
    datastore_id = "local" 
    file_id      = proxmox_virtual_environment_download_file.debian13_cloudinit.id
    interface    = "scsi0"
    size         = "30"
  }

  disk {
    datastore_id = "local"
    interface    = "scsi1"
    size         = "40"
    file_format  = "qcow2"
  }

  efi_disk {
    datastore_id = "local"
    type         = "4m"
  }

  tpm_state {
    datastore_id = "local"
  }

  cpu {
    cores = 8
    type  = "x86-64-v2-AES"
  }

  machine = "q35"
  bios    = "ovmf"

  network_device {
    bridge = "cluster"
  }

  operating_system {
    type = "l26"
  }

  serial_device {
    device = "socket"
  }



  initialization {
    datastore_id = "local"
    dns {
      domain  = var.root_domain
      servers = [var.dns_server]
    }
    ip_config {
      ipv4 {
        address = "${var.kube_ip_prefix}.205/24"
        gateway = "${var.kube_ip_prefix}.1"
      }
    }

    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id

  }
}

resource "proxmox_virtual_environment_vm" "kube-WORKER4" {
  name        = "kube-WORKER4"
  description = "Managed by Terraform"
  node_name   = var.virtual_environment_node_name
  vm_id       = "206"

  agent {
    enabled = true
  }

  memory {
    dedicated = var.ram_per_node
    floating  = var.ram_per_node
  }

  disk {
    datastore_id = "local" 
    file_id      = proxmox_virtual_environment_download_file.debian13_cloudinit.id
    interface    = "scsi0"
    size         = "30"
  }

  disk {
    datastore_id = "local"
    interface    = "scsi1"
    size         = "40"
    file_format  = "qcow2"
  }

  efi_disk {
    datastore_id = "local"
    type         = "4m"
  }

  tpm_state {
    datastore_id = "local"
  }

  cpu {
    cores = 8
    type  = "x86-64-v2-AES"
  }

  machine = "q35"
  bios    = "ovmf"

  network_device {
    bridge = "cluster"
  }

  operating_system {
    type = "l26"
  }

  serial_device {
    device = "socket"
  }



  initialization {
    datastore_id = "local"
    dns {
      domain  = var.root_domain
      servers = [var.dns_server]
    }
    ip_config {
      ipv4 {
        address = "${var.kube_ip_prefix}.206/24"
        gateway = "${var.kube_ip_prefix}.1"
      }
    }

    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id

  }
}
