//Create Subnets

resource "azurerm_subnet" "subnet_certheadlab" {
  for_each             = var.subnets
  name                 = each.value["name"]
  address_prefixes     = each.value["address_prefixes"]
  resource_group_name  = var.vnetrg
  virtual_network_name = var.vnetname

}
