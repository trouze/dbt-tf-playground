terraform {
  required_providers {
    dbtcloud = {
      source  = "dbt-labs/dbtcloud"
    }
  }
}

resource "dbtcloud_repository" "repository" {
  project_id         = var.project.id
  remote_url         = var.repository_data.remote_url
  gitlab_project_id  = var.repository_data.gitlab_project_id
  git_clone_strategy = "deploy_token"
}