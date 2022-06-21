# Backend to store Terraform state file

terraform {
  backend "azurerm" {
    resource_group_name  = "praneeth-tfstate"
    storage_account_name = "praneethtfstate3867"
    container_name       = "tfstate"
    key                  = "common/terraform.tfstate"
  }
}