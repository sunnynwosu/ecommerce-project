terraform {
  backend "azurerm" {
    resource_group_name = "ecommerce-tfstate-rg"
    storage_account_name = "ecommtfstate1745018613"
    container_name = "tfstate"
    key = "prod.tfstate"
  }
}