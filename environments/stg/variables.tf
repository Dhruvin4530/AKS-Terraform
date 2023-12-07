# resource group name
variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

# region
variable "region" {
  type        = string
  description = "Region"
}

# Virtual Network CIDR
variable "vnetCIDR" {
  type        = list(string)
  description = "Virtual Network CIDR"
}

# subnet CIDRs
variable "subnetCIDRs" {
  type        = list(string)
  description = "Subnet CIDRs"
}

# environment
variable "environment" {
  type        = string
  description = "Environment"
}
