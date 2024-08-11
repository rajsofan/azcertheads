//Create a resource group for the lab

resource "azurerm_resource_group" "azcerheadlabrg" {
    location = "uksouth"
    name = "azcertheadlab-rg01"
  
}