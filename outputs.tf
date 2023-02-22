Output "ips" {
  #value = libvirt_domain.domain-ubuntu
  #value = libvirt_domain.domain-ubuntu.*.network_interface
  # show IP, run 'terraform refresh' if not populated
value = libvirt_domain.domain-ubuntu.*.network_interface.0.addresses
}
