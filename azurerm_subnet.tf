# Create subnets

resource "azurerm_subnet" "master-subnet" {
  name                                          = "master-subnet"
  resource_group_name                           = azurerm_resource_group.openshift-cluster.name
  virtual_network_name                          = azurerm_virtual_network.virtual-network.name
  address_prefixes                              = local.aro_master_cidr
  enforce_private_link_service_network_policies = true

  delegation {
    name = "accountdelegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }
}

resource "azurerm_subnet" "worker-subnet" {
  name                 = "worker-subnet"
  resource_group_name  = azurerm_resource_group.openshift-cluster.name
  virtual_network_name = azurerm_virtual_network.virtual-network.name
  address_prefixes     = local.aro_worker_cidr

  delegation {
    name = "accountdelegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }
}
