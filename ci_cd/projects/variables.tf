variable "azuredevops_personal_access_token" {
  type = string
}

variable "azurerm_spn_tenantid" {
  type = string
}

variable "azurerm_subscription_id" {
  type = string
}

variable "azuredevops_projects" {
  type = map(object({
    visibility         = string
    version_control    = string
    work_item_template = string
    description        = string
  }))
}

variable "github_repos" {
  type = map(object({
    initialization = object({
      init_type   = string
      source_type = string
      source_url  = string
    })
  }))
}

variable "azurerm_subscription_name" {
  type = string
}

variable "azuredevops_org_url" {
  type = string
}

variable "azurerm_spn_client_id" {
  type = string
}

variable "azurerm_spn_secret" {
  type = string
}