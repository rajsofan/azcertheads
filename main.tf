//Create a resource group for the lab

resource "azurerm_resource_group" "azcerheadlabrg" {
  location = var.location
  name     = var.azcertheadrgname

}

//Create Vnet

resource "azurerm_virtual_network" "azcertheadlabvnet" {

  name                = var.vnet1name
  resource_group_name = azurerm_resource_group.azcerheadlabrg.name
  location            = azurerm_resource_group.azcerheadlabrg.location
  address_space       = var.vnet1addressSpace

}

//Create Subnets

resource "azurerm_subnet" "subnet_certheadlab" {
  for_each = var.subnets
  name = each.value["name"]
  address_prefixes = each.value["address_prefixes"]
  resource_group_name = azurerm_resource_group.azcerheadlabrg.name
  virtual_network_name = azurerm_virtual_network.azcertheadlabvnet.name

}
