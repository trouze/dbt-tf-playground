terraform {
  required_providers {
    dbtcloud = {
      source  = "dbt-labs/dbtcloud"
    }
  }
}

resource "dbtcloud_databricks_credential" "databricks_credential" {
  for_each = {
    for env in var.environments_data :
    env.name => env.credential
  }
  project_id = var.project_id
  token      = lookup(var.token_map, each.value.token_name, null)
  schema     = each.value.schema
  adapter_type = "databricks"
}
