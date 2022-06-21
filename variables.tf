# Input variables are parameters for Terraform modules

variable "workspace_to_environment_map" {
  type = map(any)
  default = {
    default = "nonprod"
    nonprod = "nonprod"
    prod    = "prod"
    quay    = "quay"
  }
}

variable "location" {
  description = "The location where the resource group should be created"
  type        = string
  default     = "australiaeast"
}

variable "pull-secret" {
  default = {}
}

variable "client_object_id" {
  description = "The Application ID used by the Azure Red Hat OpenShift"
}

variable "clientId" {
  description = "The Application ID used by the Azure Red Hat OpenShift"
}

variable "clientSecret" {
  description = "The Application Secret used by the Azure Red Hat OpenShift"
}

# az provider show --namespace Microsoft.RedHatOpenShift --query "id"
variable "rp_object_id" {
  description = "The Resource Provider ID for Azure Red Hat OpenShift"
}

variable "clusterName" {
  description = "ARO Azure Red Hat OpenShift Cluster Name"
}

variable "openshiftclusterrg" {
  description = "ARO Azure Red Hat OpenShift RG"
}

variable "domainResourceGroupName" {
  description = "ARO Azure Red Hat OpenShift Domain RG"
}

variable "subscription_id" {}
variable "tenant_id" {}

variable "roles" {
  description = "Roles to be assigned to the Principal"
  type        = list(object({ role = string }))
  default = [
    {
      role = "Contributor"
    },
    {
      role = "User Access Administrator"
    }
  ]
}
