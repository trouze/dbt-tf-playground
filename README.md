# demo-dbt-cloud-tf
Repository storing dbt Cloud terraform resources for demonstration projects

```
export TF_VAR_token_map=$(env | grep '^TF_VAR_' | awk -F= '{gsub(/^TF_VAR_/, "", $1); printf "\"%s\": \"%s\", ", $1, $2}' | sed 's/, $//')
```
