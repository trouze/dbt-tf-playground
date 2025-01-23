// define the variables we will use
variable "dbt_account_id" {
  type = number
}

variable "dbt_token" {
  type = string
}

variable "dbt_host_url" {
  type = string
}

terraform {
    required_providers {
        dbtcloud = {
            source = "dbt-labs/dbtcloud"
            version = "~> 0.3"
        }
    }
}

provider "dbtcloud" {
  account_id = var.dbt_account_id
  token      = var.dbt_token
  host_url   = var.dbt_host_url
}

locals {
  data = jsondecode(file(var.json_file))
}

variable "json_file" {
  description = "Path to the JSON file"
  type        = string
}

# environments
resource "dbtcloud_environment" "environments" {
  for_each = { for env in local.data.environments : env.name => env }

  connection_id              = each.value.connection_id
  dbt_version                = each.value.dbt_version
  enable_model_query_history = each.value.enable_model_query_history
  name                       = each.value.name
  project_id                 = each.value.project_id
  type                       = each.value.type

  # Optional fields with defaults for missing values
  credential_id              = lookup(each.value, "credential_id", null)
  custom_branch              = lookup(each.value, "custom_branch", null)
  deployment_type            = lookup(each.value, "deployment_type", null)
  use_custom_branch          = lookup(each.value, "use_custom_branch", false)
}
