variable "project_id" {
  description = "The ID of the project to which jobs belong"
  type        = string
}

variable "environment_ids" {
  description = "The ID of the project this repository is associated with"
  type        = map(string)
}

variable "environments_data" {
  description = "List of environment configurations, including credentials"
  type = list(object({
    jobs = list(object({
    name                       = string
    execute_steps              = list(string)
    environment_id            = optional(number)
    project_id                = number
    triggers                  = map(bool)
    dbt_version               = optional(string)
    deferring_environment_id  = optional(number)
    deferral                  = optional(bool, false)
    deferring_job_id          = optional(number)
    description               = optional(string)
    errors_on_lint_failure    = optional(bool, true)
    generate_docs             = optional(bool, false)
    is_active                 = optional(bool, true)
    job_completion_trigger_condition = optional(object({
      job_id = number
      condition = string
    }))
    num_threads               = optional(number)
    run_compare_changes       = optional(bool, false)
    run_generate_sources      = optional(bool, false)
    run_lint                  = optional(bool, false)
    schedule_cron             = optional(string)
    schedule_days             = optional(list(number))
    schedule_hours            = optional(list(number))
    schedule_interval         = optional(number)
    schedule_type             = optional(string)
    self_deferring            = optional(bool, false)
    target_name               = optional(string)
    timeout_seconds           = optional(number)
    triggers_on_draft_pr      = optional(bool, false)
    }))
  }))
}
