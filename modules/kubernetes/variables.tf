# location
variable "location" {
  type        = string
  description = "location of the resource group"
}

# resource group name
variable "resource_group_name" {
  type        = string
  description = "name of the resource group"
}

# environment
variable "environment" {
  type        = string
  description = "environment"
}

# max node count
variable "max_count" {
  type        = number
  description = "Maximum node count for worker node"
}

# min node count
variable "min_count" {
  type        = number
  description = "Minimum node count for worker node"
}

# subnet ID
variable "vnet_subnet_id" {
  type        = string
  description = "Subnet ID for worker node"
}

# Size of worker nodes
variable "node_vm_size" {
  type        = string
  description = "Worker nodes size"
}