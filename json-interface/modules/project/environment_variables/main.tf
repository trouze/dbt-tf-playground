terraform {
  required_providers {
    dbtcloud = {
      source  = "dbt-labs/dbtcloud"
    }
  }
}

resource "dbtcloud_environment_variable" "environment_variables" {
  for_each = {
    for env_var in var.environment_variables :
    env_var.name => env_var
  }

  name           = each.value.name
  project_id     = var.project_id
  environment_values = {
    for key, value in each.value.environment_values :
    key => startswith(value, "secret_") ? lookup(var.token_map, value, null) : value
  }
}
