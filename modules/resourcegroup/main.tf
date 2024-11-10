//Create a resource group for the lab

resource "azurerm_resource_group" "azcerheadlabrg" {
  location = var.location
  name     = var.azcertheadrgname

}
