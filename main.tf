terraform {
  backend "azurerm" {
    resource_group_name  = "storage"
    storage_account_name = "alphatf"
    container_name       = "tfstate"
    key                  = "alphak8sdev.tfstate"
  }
}

# Configure the Azure provider
provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x. 
  # If you are using version 1.x, the "features" block is not allowed.
  version = "~>2.39.0"
  features {}
}

# Configure the Microsoft Azure Active Directory Provider
provider "azuread" {
  version = "=0.7.0"
}
data "azurerm_subscription" "current" {
}

output "current_subscription_tenant_id" {
  value = data.azurerm_subscription.current.tenant_id
}
