# backend
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-aks"
    storage_account_name = "aksdemostorageaccount"
    container_name       = "aks"
    key                  = "terraform.tfstate"
  }
}
