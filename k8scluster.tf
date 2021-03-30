resource "azurerm_kubernetes_cluster" "alpha_aks_dev" {
  name                = "${var.org}-${var.svc}-${var.env}"
  location            = var.loc
  resource_group_name = azurerm_resource_group.alpha_aks_dev_rg.name
  dns_prefix          = "${var.org}${var.env}"

  default_node_pool {
    name                = "default"
    node_count          = 1
    vm_size             = "Standard_B2s"
    type                = "VirtualMachineScaleSets"
    availability_zones  = ["1", "2"]
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 3
    vnet_subnet_id      = azurerm_subnet.alpha_aks_dev_subnet.id
  }

  role_based_access_control {
    azure_active_directory {
      managed                = true
      admin_group_object_ids = ["PRE-CREATE!! - AzureAD Security Group ID Goes Here"]
    }
    enabled = true
  }
  ##Below is default for identity
  identity {
    type = "SystemAssigned"
  }

  tags = {
    CreatedBy   = "Terraform"
    Purpose     = "Development Infrastructure Testing"
    Environment = "Develop"
  }
}
