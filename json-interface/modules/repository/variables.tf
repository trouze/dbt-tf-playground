variable "repository_data" {
  description = "Repository configuration"
  type = object({
    remote_url       = string
    gitlab_project_id = number
  })
}

variable "project_id" {
  description = "The ID of the project this repository is associated with"
  type        = string
}