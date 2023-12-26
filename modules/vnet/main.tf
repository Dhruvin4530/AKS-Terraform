# create resource group 
resource "azurerm_resource_group" "rg-name" {
  name     = var.resource_group_name
  location = var.location
}

# create network security group
resource "azurerm_network_security_group" "public_nsg" {
  name                = "${var.environment}-aks-security-group"
  location            = var.location
  resource_group_name = var.resource_group_name
  depends_on          = [azurerm_resource_group.rg-name]

  security_rule {
    name                       = "http_rule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "https_rule"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    Environment = var.environment
  }
}

# create virtual network 
resource "azurerm_virtual_network" "virtual_network" {
  name                = "${var.environment}-aks-virtual-network"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  depends_on          = [azurerm_resource_group.rg-name]

  tags = {
    Environment = var.environment
  }
}

# create public subnets
resource "azurerm_subnet" "public_subnet" {
  name                 = "${var.environment}-public-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = var.subnet_address_prefix
}

# associate NSG to public subnets
resource "azurerm_subnet_network_security_group_association" "nsg_associate_public" {
  subnet_id                 = azurerm_subnet.public_subnet.id
  network_security_group_id = azurerm_network_security_group.public_nsg.id
}