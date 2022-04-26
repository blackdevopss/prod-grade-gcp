resource "azuredevops_project" "azdo" {
  for_each           = var.azuredevops_projects
  name               = each.key
  visibility         = each.value.visibility
  version_control    = each.value.version_control
  work_item_template = each.value.work_item_template
  description        = each.value.description

  features = {
    "testplans" = each.value.features.testplans
    "artifacts" = each.value.features.artifacts
  }
}

resource "azuredevops_git_repository" "github" {
  for_each   = var.github_repos
  project_id = azuredevops_project.azdo[each.key].id
  name       = each.key
  initialization {
    init_type   = each.value.initialization.init_type
    source_type = each.value.initialization.source_type
    source_url  = each.value.initialization.source_url
  }
}


resource "azuredevops_git_repository" "develop" {
  project_id = data.azuredevops_project.prod_grade_gcp.id
  name       = "develop"
  initialization {
    init_type = "Clean"
  }
}


data "azuredevops_project" "prod_grade_gcp" {
  name = "prod-grade-gcp"

  depends_on = [
    azuredevops_project.azdo
  ]
}

output "proj_id" {
  value = data.azuredevops_project.prod_grade_gcp.id
}