# create resource group 
resource "azurerm_resource_group" "rg-name" {
  name     = var.resource_group_name
  location = var.location
}

# create network security group
resource "azurerm_network_security_group" "sandbox" {
  name                = "${var.environment}-aks-security-group"
  location            = var.location
  resource_group_name = var.resource_group_name
  depends_on          = [azurerm_resource_group.rg-name]

  tags = {
    Environment = var.environment
  }
}

# create virtual network 
resource "azurerm_virtual_network" "pool" {
  name                = "${var.environment}-aks-virtual-network"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  depends_on          = [azurerm_resource_group.rg-name]

  tags = {
    Environment = var.environment
  }
}

# create subntes
resource "azurerm_subnet" "pool" {
  count                = length(var.subnet_address_prefix)
  name                 = "${var.environment}-subnet-${count.index + 1}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.pool.name
  address_prefixes     = [var.subnet_address_prefix[count.index]]
}
