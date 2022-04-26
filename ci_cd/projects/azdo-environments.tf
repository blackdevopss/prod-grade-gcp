resource "azuredevops_environment" "env" {
  for_each   = var.azuredevops_environments
  project_id = data.azuredevops_project.prod_grade_gcp.id
  name       = each.value.name
}

variable "azuredevops_environments" {
  type = map(object({
    name = string
  }))

  default = {


  }
}