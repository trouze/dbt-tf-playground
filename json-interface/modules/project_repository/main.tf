terraform {
  required_providers {
    dbtcloud = {
      source  = "dbt-labs/dbtcloud"
    }
  }
}

resource "dbtcloud_project_repository" "project_repository" {
  project_id    = var.project.id
  repository_id = var.repository.id
}