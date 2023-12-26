# virtual network ID
output "vnetID" {
  value       = azurerm_virtual_network.virtual_network.id
  description = "ID of virtual network"
}

# vnet public subnets
output "public_subnet_id" {
  value       = azurerm_subnet.public_subnet.id
  description = "Public Subnet ID"
}

# resourcec group name
output "resource_group_name" {
  value       = azurerm_resource_group.rg-name.name
  description = "Resource group name"
}