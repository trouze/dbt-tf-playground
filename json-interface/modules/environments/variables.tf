variable "project_id" {
  description = "The ID of the project to which environments belong"
  type        = string
}

variable "environments_data" {
  description = "List of environment configurations, including credentials"
  type = list(object({
    name                       = string
    connection_id              = number
    dbt_version                = string
    enable_model_query_history = bool
    credential                 = object({
      token_name = string
      schema     = string
    })
    custom_branch              = optional(string)
    deployment_type            = optional(string)
    use_custom_branch          = optional(bool, false)
  }))
}

variable "credential_ids" {
  description = "A map of environment names to their corresponding credential IDs"
  type = map(string)
  default = {}
}
