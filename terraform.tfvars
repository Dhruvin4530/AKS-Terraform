resource_group_name = "rg-stg-aks"
region              = "eastus"
vnetCIDR            = ["10.163.0.0/16"]
subnetCIDRs         = ["10.163.0.0/21"]
environment         = "staging"
max_node_count      = 3
min_node_count      = 1
node_vm_size        = "Standard_D2_v2"