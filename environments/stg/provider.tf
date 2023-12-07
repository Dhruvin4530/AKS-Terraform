# backend 
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-aks"
    storage_account_name = "aksdemostorageaccount"
    container_name       = "sandbox"
    key                  = "stg.terraform.tfstate"
    lock {
      enabled = true
    }
  }
}

# provider
provider "azurerm" {
  features {}
}
