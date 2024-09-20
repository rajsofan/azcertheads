terraform {
  backend "azurerm" {
    resource_group_name  = "Terraformstate-RG01"
    storage_account_name = "strgaccountrfrmstate01"
    container_name       = "tfstate"
    key                  = "tfstatefile.json"
  }
}
