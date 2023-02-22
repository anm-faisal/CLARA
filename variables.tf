variable "hostname" {
	type = string
	description = "hostname"
}
variable "domain" {
    type = string
    description = "domain"
}
variable "ip_type" {
    type = string
    default = "static"
    description = "IP type for VM"
}
variable "memoryMB" {
    type = number
    default = 1024*1
    description = "VM Membory in MB"
}
variable "cpu" {
    type = number
    default = 1
    description = "CPU for VM"
}
variable "prefixIP" {
    type = string
    default = "192.168.122"
    description = "VM IP prefix"
}
variable "octetIP" {
    type = string
    default = "31"
    description = "VM IP octet"
}
variable "pool" {
    type = string
    default = "default"
    description = "Storage pool"
}

