terraform {
  required_providers {
    dbtcloud = {
      source  = "dbt-labs/dbtcloud"
    }
  }
}

resource "dbtcloud_repository" "repository" {
  project_id         = var.project_id
  remote_url         = var.repository_data.remote_url
  github_installation_id  = var.repository_data.gitlab_project_id
  git_clone_strategy = "github_app"
}