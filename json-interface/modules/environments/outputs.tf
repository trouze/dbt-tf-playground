output "environment_ids" {
  value = { for env, environment in dbtcloud_environment.environments : env => environment.id }
}
