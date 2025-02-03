# Setup
## Loading credentials into the env
Please use the following pattern to load dbx tokens into the environment so terraform can set them in dbt Cloud.
```
export TF_VAR_databricks_tokens='{
  "token_some_name": "secure-token-123",
  "token_other_name": "secure-token-456"
}'
```

# Credential Rotation
You can use the same terraform module to *only* rotate Databricks credentials:
```
terraform apply -target=dbtcloud_databricks_credential.databricks_credential
```

## Contributing and testing this module
```
terraform plan/apply 