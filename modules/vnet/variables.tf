# resource group name
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

# location
variable "location" {
  type        = string
  description = "Location of the resource group"
}

# vnet CIDR
variable "address_space" {
  type        = list(string)
  description = "CIDR of the vnet"
}

# subnet CIDRs
variable "subnet_address_prefix" {
  type        = list(string)
  description = "CIDR of subnet"
}

# environment
variable "environment" {
  type        = string
  description = "Environment"
}