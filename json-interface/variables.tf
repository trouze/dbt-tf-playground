// define the variables we will use
variable "dbt_account_id" {
  type = number
}

variable "dbt_token" {
  type = string
  sensitive = true
}

variable "dbt_host_url" {
  type = string
}

# variables
variable "yaml_file" {
  description = "Path to the JSON file"
  type        = string
}

# load json project configuration file
locals {
  project_config = yamldecode(file(var.yaml_file))
}

# there could be multiple credentials
variable "databricks_tokens" {
  type        = map(string)
  default     = null
  description = "API token for DBT Cloud authentication"
  sensitive   = true
}