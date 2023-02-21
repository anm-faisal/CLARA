terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
cluster_name         = "prod"
base_image           = "/tmp/flatcar_production_qemu_image.img"
ssh_keys             = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCdXS3QzQkKjU9RhM4Y2UHjVUwxqxle9YRhX5p6nMvOwldBKdPIyW1FMTyqL5mC4BwUCRADeMKdT9OhLhjh5VvOWJ2jciwz9kGrMxpwghDEzOKDygPBuP0uz/TqJgSPA7MXKcxJq0jiPj7X5pJ7uanhDiRi0t+xRYGqpA16YJ/lABMAzEPe2oV9dUGwtOAJ+tQz4nVNM6NtEDnqLa9yqTEQBNOBWTAzf49AiYkwvTmv+0Y1naltFzp7jxWM4wu4hKP6abtlBkomb0wmWXvu3amNAa+b0WfTJeowFHv9DTstzA3fBgifjZ3UyCHsbU+gdlg0suRI54U7pQHfQDs3UutC56gODsYRiK4Fa54VN+PittsWsbTahfRqdE+J9POSn97LVoYYDOK3//TYDC0mRfHmamsac0BfVPALCHUrsPMGuPfLIltxjZcF01cGyQG9qdqAAtl+EPTLYBVwgOiqFj6XHOWbTJqB9xzBDIJsxrTkd1MddtTZA5tJMOuIe+4Yobs= rudolf@WIN11"]
external_bridge_name = "br0"
internal_bridge_name = "br1"
internal_ip_addresses = {
  "ingress"       = 89,
  "controller-01" = 81,
  "controller-02" = 82,
  "controller-03" = 83,
  "worker-01"     = 84,
  "worker-02"     = 85,
  "worker-03"     = 86
}
external_ip_addresses = {
  "ingress" = 201
}
virtual_cpus = {
  "ingress"       = 2,
  "controller-01" = 4,
  "controller-02" = 4,
  "controller-03" = 4,
  "worker-01"     = 4,
  "worker-02"     = 6,
  "worker-03"     = 6
}
virtual_memory = {
  "ingress"       = 5120,
  "controller-01" = 7168,
  "controller-02" = 6144,
  "controller-03" = 6144,
  "worker-01"     = 10240,
  "worker-02"     = 8192,
  "worker-03"     = 8192
}