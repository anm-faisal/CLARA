terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.7.1"
    }
  }
}	

provider "libvirt" {
    uri = "qemu+ssh://faisalan@clarauq03p.sth.health.qld.gov.au/system?keyfile=/home/faisalan/.ssh/id_rsa"
}

  resource "libvirt_volume" "base_os_image" {
  name = "${var.hostname}-base_os_image"
  pool = var.pool
  # using newest ubuntu focal 20.04
  #source = "https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img"
  source = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
  format = "qcow2"
  
}

/*
resource "libvirt_volume" "os_image" {
  name =  "${var.hostname}-os_image"
  pool = var.pool
  format = "qcow2"
  size = 53687091200
  base_volume_id = libvirt_volume.base_os_image.id
}
resource "libvirt_cloudinit_disk" "commoninit" {
          name = "${var.hostname}-commoninit.iso"
          pool = var.pool
          user_data = data.template_file.user_data.rendered
          network_config = data.template_file.network_config.rendered
}
data "template_file" "user_data" {
  template = file("${path.module}/cloud_init.cfg")
  vars = {
    hostname = var.hostname
    fqdn = "${var.hostname}.${var.domain}"
  }
}

data "template_file" "network_config" {
  template = file("${path.module}/network_config_${var.ip_type}.cfg")
  vars = {
    domain = var.domain
    prefixIP = var.prefixIP
    octetIP = var.octetIP
  }
}
# Create the machine
resource "libvirt_domain" "domain-ubuntu" {
  # domain name in libvirt, not hostname
  name = "${var.hostname}-${var.prefixIP}.${var.octetIP}"
  memory = var.memoryMB
  vcpu = var.cpu

  disk {
       volume_id = libvirt_volume.os_image.id
  }
  network_interface {
       network_name = "host-bridge"
 }

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  # IMPORTANT
  # Ubuntu can hang is a isa-serial is not present at boot time.
  # If you find your CPU 100% and never is available this is why
  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }
 graphics {
    type        = "vnc"
    listen_type = "address"
  }
}
*/

     
