# virtual network ID
output "vnetID" {
  value       = azurerm_virtual_network.pool.id
  description = "ID of virtual network"
}

# subnets ID
output "subnetIDs" {
  value       = azurerm_subnet.pool[*].id
  description = "IDs of subnets"
}

