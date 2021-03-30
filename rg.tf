resource "azurerm_resource_group" "alpha_aks_dev_rg" {
  name = "${var.org}-${var.svc}-${var.env}-rg"
  location = var.loc
}