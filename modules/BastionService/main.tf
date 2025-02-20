resource "azurerm_public_ip" "azlabpubip" {
  name                = var.bastion_name
  resource_group_name = var.azcertheadrgname
  location            = var.location
  allocation_method   = var.pubipallocationmethod
  sku                 = var.pubipsku
}


resource "azurerm_bastion_host" "azlabbastion" {
  name                = var.bastion_name
  resource_group_name = var.azcertheadrgname
  location            = var.location
  ip_configuration {
    subnet_id            = var.bastion_subnet_id
    name                 = var.bastion_ipconfig_name
    public_ip_address_id = azurerm_public_ip.azlabpubip.id
  }
}