# creating virtual network
module "vnet" {
  source                = "../../modules/vnet"
  resource_group_name   = var.resource_group_name
  location              = var.region
  address_space         = var.vnetCIDR
  subnet_address_prefix = var.subnetCIDRs
  environment           = var.environment
}

# creating EKS
module "eks" {
  source              = "../../modules/kubernetes"
  location            = var.region
  resource_group_name = module.vnet.resource_group_name
  environment         = var.environment
  max_count           = var.max_node_count
  min_count           = var.min_node_count
}