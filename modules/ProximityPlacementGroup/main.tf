resource "azurerm_proximity_placement_group" "azlabppg" {
  name                = var.ppg_name
  location            = var.location
  resource_group_name = var.resource_group_name


}
