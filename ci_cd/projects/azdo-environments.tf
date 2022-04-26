resource "azuredevops_environment" "env" {
  for_each   = var.azuredevops_environments
  project_id = azuredevops_project.azdo[each.key].id
  name       = each.each.key
}

variable "azuredevops_environment" {
  type = map(object({
    name = string
  }))

  default = {

    "dev" = {
      name = "Dev"
    }
    "stage" = {
      name = "stage"
    }
    "prd" = {
      name = "Prod"
    }
  }
}