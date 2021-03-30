resource "azurerm_virtual_network" "alpha_aks_dev_vnet" {
  name                = "${var.org}-${var.svc}-${var.env}-vnet"
  location            = azurerm_resource_group.alpha_aks_dev_rg.location
  resource_group_name = azurerm_resource_group.alpha_aks_dev_rg.name
  address_space       = ["10.10.0.0/16"]
}
resource "azurerm_subnet" "alpha_aks_dev_subnet" {
  name                 = "${var.org}-${var.svc}-${var.env}-subnet"
  virtual_network_name = azurerm_virtual_network.alpha_aks_dev_vnet.name
  resource_group_name  = azurerm_resource_group.alpha_aks_dev_rg.name
  address_prefixes     = ["10.10.0.0/22"]
}