resource "azurerm_virtual_network" "azcertheadlabvnet" {

  name                = var.vnet1name
  resource_group_name = var.vnetrg
  location            = var.location
  address_space       = var.vnet1addressSpace

}
