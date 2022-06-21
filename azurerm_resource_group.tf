# Create a resource group

resource "azurerm_resource_group" "openshift-cluster" {
  name     = var.openshiftclusterrg
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_resource_group" "openshift-domain" {
  name     = var.domainResourceGroupName
  location = var.location
  tags     = local.common_tags
}
