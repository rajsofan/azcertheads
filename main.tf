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


resource "azurerm_subnet" "azcertheadlabsub1" {
  virtual_network_name = azurerm_virtual_network.azcertheadlabvnet.name
  resource_group_name  = azurerm_resource_group.azcerheadlabrg.name
  name                 = var.workloadSubnetName
  address_prefixes     = var.workloadSubneAddressSpace

}

resource "azurerm_subnet" "azcertheadlabgatewaysubnet" {
  name                 = var.GatewaySubnetName
  address_prefixes     = var.GatewaySubnetNameAddressSpace
  resource_group_name  = azurerm_resource_group.azcerheadlabrg.name
  virtual_network_name = azurerm_virtual_network.azcertheadlabvnet.name
}
resource "azurerm_subnet" "azcertheadfirewallsubnet" {
  name                 = var.AzureFirewallSubnetName
  address_prefixes     = var.AzureFirewallSubnetAddressSpace
  resource_group_name  = azurerm_resource_group.azcerheadlabrg.name
  virtual_network_name = azurerm_virtual_network.azcertheadlabvnet.name
}
resource "azurerm_subnet" "azcertheadfirewallmgmtsubnet" {
  name                 = var.AzureFirewallManagmentSubnetName
  address_prefixes     = var.AzureFirewallManagmentSubnetAddressSpace
  resource_group_name  = azurerm_resource_group.azcerheadlabrg.name
  virtual_network_name = azurerm_virtual_network.azcertheadlabvnet.name
}

