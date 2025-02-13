# Setup
## Loading credentials into the env
Please use the following pattern to load dbx tokens into the environment so terraform can set them in dbt Cloud.
```
export TF_VAR_databricks_tokens='{"token_some_name": "secure-token-123","token_other_name": "secure-token-456"}'
```

# Credential Rotation
You can use the same terraform module to *only* rotate Databricks credentials:
```
terraform apply -target=dbtcloud_databricks_credential.databricks_credential
```

## Contributing and testing this module
```
terraform plan/apply -var "yaml_file=./deploy/terraform/dbtcloud-kv271-70403103916054/projects/demo_project/demo_project.yml" -var-file=".tfvars" -state="./deploy/terraform/dbtcloud-kv271-70403103916054/projects/demo_project/demo_project.tfstate"
```

## Full YAML spec

```
# yaml-language-server: $schema=https://raw.githubusercontent.com/trouze/dbt-cloud-terraform-starter/refs/heads/main/schemas/project/v1.json
project:
  name: <string> # Required. Name of the dbt project.
  repository:
    remote_url: <string> # Required. URL of the remote Git repository.
    gitlab_project_id: <number> # Optional. GitLab project ID if using GitLab integration.
    # Defaults: None.
  environments:
    - name: <string> # Required. Name of the environment.
      credential:
        token_name: <string> # Optional. Name of the token to use.
        schema: <string> # Optional. Schema to be used.
        # Defaults: None.
      connection_id: <number> # Required. Connection ID for the environment.
      type: <string> # Required. Type of environment. Allowed values: 'development', 'deployment'.
      dbt_version: <string> # Optional. dbt version to use.
      enable_model_query_history: <boolean> # Optional. Enable model query history. Defaults to false.
      custom_branch: <string> # Optional. Custom branch for dbt. Defaults to null.
      deployment_type: <string> # Optional. Deployment type (e.g., 'production'). Defaults to null.
      jobs:
        - name: <string> # Required. Name of the job.
          execute_steps: 
            - <string> # Required. Steps to execute in the job.
          triggers:
            github_webhook: <boolean> # Optional. Trigger job on GitHub webhook. Defaults to false.
            git_provider_webhook: <boolean> # Optional. Trigger job on Git provider webhook. Defaults to false.
            schedule: <boolean> # Optional. Trigger job on a schedule. Defaults to false.
            on_merge: <boolean> # Optional. Trigger job on merge. Defaults to false.
          dbt_version: <string> # Optional. dbt version for the job. Defaults to null.
          deferral: <boolean> # Optional. Enable deferral. Defaults to false.
          deferring_job_id: <number> # Optional. ID of the deferring job. Defaults to null.
          description: <string> # Optional. Description of the job. Defaults to null.
          errors_on_lint_failure: <boolean> # Optional. Fail job on lint errors. Defaults to true.
          generate_docs: <boolean> # Optional. Generate docs. Defaults to false.
          is_active: <boolean> # Optional. Whether the job is active. Defaults to true.
          num_threads: <number> # Optional. Number of threads for the job. Defaults to 4.
          run_compare_changes: <boolean> # Optional. Compare changes before running. Defaults to false.
          run_generate_sources: <boolean> # Optional. Generate sources before running. Defaults to false.
          run_lint: <boolean> # Optional. Run lint before running. Defaults to false.
          schedule_cron: <string> # Optional. Cron schedule for the job. Defaults to null.
          schedule_days: <array> # Optional. Days for schedule. Defaults to null.
          schedule_hours: <array> # Optional. Hours for schedule. Defaults to null.
          schedule_interval: <string> # Optional. Interval for schedule. Defaults to null.
          schedule_type: <string> # Optional. Type of schedule. Defaults to null.
          self_deferring: <boolean> # Optional. Whether the job is self-deferring. Defaults to false.
          target_name: <string> # Optional. Target name for the job. Defaults to null.
          timeout_seconds: <number> # Optional. Job timeout in seconds. Defaults to 0.
          triggers_on_draft_pr: <boolean> # Optional. Trigger job on draft PRs. Defaults to false.
  environment_variables:
    - name: <string> # Required. Name of the environment variable.
      environment_values:
        project: <string> # Optional. Value for the project scope.
        Development Environment: <string> # Optional. Value for the development environment.
        Production Environment: <string> # Optional. Value for the production environment.
        # Defaults: None.

```

# Extending this module for Account level resources
If you'd like to expand the usage of the current set of terraform modules to manage account configs in dbt Cloud, I'd recommend creating a folder in projects that houses the account information.