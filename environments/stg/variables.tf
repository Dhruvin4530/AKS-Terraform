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

# max node count 
variable "max_node_count" {
  type        = number
  description = "Maximun node count for worker node"
}

# min node count 
variable "min_node_count" {
  type        = number
  description = "Minimum node count for worker node"
}