resource "dbtcloud_environment_variables" "environment_variables" {
  for_each = {
    for env_var in var.environment_variables :
    env_var.name => env_var
  }

  name = each.value.name
  project_id = var.project_id
  environment_values = each.value.environment_values
}