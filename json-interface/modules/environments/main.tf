terraform {
  required_providers {
    dbtcloud = {
      source  = "dbt-labs/dbtcloud"
    }
  }
}

resource "dbtcloud_environment" "environments" {
  for_each = {
    for env in var.environments_data :
    env.name => env
  }

  project_id     = var.project_id
  credential_id  = lookup(var.credential_ids, each.key, null)  # Using the map of credential_ids output from the credentials module
  connection_id  = each.value.connection_id

  dbt_version                = each.value.dbt_version
  enable_model_query_history = each.value.enable_model_query_history
  name                       = each.value.name
  type                       = each.value.type

  # Optional fields with defaults for missing values
  custom_branch              = lookup(each.value, "custom_branch", null)
  deployment_type            = lookup(each.value, "deployment_type", null)
  use_custom_branch          = lookup(each.value, "use_custom_branch", false)
}
