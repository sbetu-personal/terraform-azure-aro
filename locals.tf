# Local values are like a function's temporary local variables

locals {
  environment = lookup(var.workspace_to_environment_map, terraform.workspace)
}

locals {
  common_tags = {
    owner   = "praneeth"
    service = "openshift"
    env     = local.environment
  }
}

locals {
  domain_name = "redhat-praneeth-${local.environment}.com"
  aro_vnet_cidr   = ["10.0.0.0/22"]
  aro_master_cidr   = ["10.0.0.0/23"]
  aro_worker_cidr   = ["10.0.2.0/23"]
}
