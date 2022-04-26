output "project_id" {
  value = tomap({
    for pid, azdo in azuredevops_project.azdo : pid => {
      project_id = azdo.id
    }
  })
}