variable "environments_data" {
  description = "List of environment configurations, including credentials"
  type = list(object({
    name       = string
    credential = object({
      token_name = string
      schema     = string
    })
  }))
}

variable "project_id" {
  description = "The ID of the project these credentials belong to"
  type        = string
}

variable "token_map" {
    type = map(string)
    description = "Mapping of token names to credential"
    sensitive = true
}