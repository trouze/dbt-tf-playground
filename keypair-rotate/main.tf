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

# copy this block for each credential you want to rotate
resource "dbtcloud_snowflake_credential" "prod_credential" {
  project_id             = var.dbt_project_id
  auth_type              = "keypair"
  database               = "DATABASE"
  schema                 = "SCHEMA"
  warehouse              = "WAREHOUSE"
  role                   = "ROLE"
  num_threads            = 16
  user                   = var.snowflake_service_account
  private_key            = var.snowflake_private_key
  private_key_passphrase = var.snowflake_passphrase
}