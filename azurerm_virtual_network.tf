# Create a virtual network within the resource group
resource "azurerm_virtual_network" "virtual-network" {
  name                = "virtual-network-${local.environment}"
  resource_group_name = azurerm_resource_group.openshift-cluster.name
  location            = azurerm_resource_group.openshift-cluster.location
  address_space       = local.aro_vnet_cidr
  tags                = local.common_tags
}
