# creating virtual network
module "vnet" {
  source                  = "../../modules/vnet"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.region
  address_space           = var.vnetCIDR
  subnet_address_prefix   = var.subnetCIDRs
}