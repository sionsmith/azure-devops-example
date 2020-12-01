variable "network_name" {
  type = string
  description = "Name of network Vm is deployed."
}

variable "subnet_name" {
  type = string
  description = "Name of subnet VM is deployed."
}

variable "core_resource_group" {
  type = string
  description = "Resource group name of where virtual network is deployed."
}