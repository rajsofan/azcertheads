//Create a resource group for the lab

resource "azurerm_resource_group" "azcerheadlabrg" {
    location = "uksouth"
    name = "azcertheadlab-rg01"
  
}

//Create Vnet

resource "azurerm_virtual_network" "azcertheadlabvnet" {

  name                = "azvnet_lab01"
  resource_group_name = azurerm_resource_group.azcertheadlabrg.name
  location            = azurerm_resource_group.azcertheadlabrg.location
  address_space       = ["192.168.0.0/24"]

}

//Create Subnets


resource "azurerm_subnet" "azcertheadlabsub1" {
  virtual_network_name = azurerm_virtual_network.azcertheadlabvnet.name
  resource_group_name  = azurerm_resource_group.azcertheadlabrg.name
  name                 = "workloadsubnet"
  address_prefixes     = ["192.168.0.0/26"]

}

resource "azurerm_subnet" "azcertheadlabgatewaysubnet" {
  name                 = "GatewaySubnet"
  address_prefixes     = ["192.168.0.64/26"]
  resource_group_name  = azurerm_resource_group.azcertheadlabrg.name
  virtual_network_name = azurerm_virtual_network.azcertheadlabvnet.name
}
resource "azurerm_subnet" "azcertheadfirewallsubnet" {
  name                 = "AzureFirewallSubnet"
  address_prefixes     = ["192.168.0.128/26"]
  resource_group_name  = azurerm_resource_group.azcertheadlabrg.name
  virtual_network_name = azurerm_virtual_network.azcertheadlabvnet.name
}
resource "azurerm_subnet" "azcertheadfirewallmgmtsubnet" {
  name                 = "AzureFirewallManagementSubnet"
  address_prefixes     = ["192.168.0.192/26"]
  resource_group_name  = azurerm_resource_group.azcertheadlabrg.name
  virtual_network_name = azurerm_virtual_network.azcertheadlabvnet.name
}

