Create a demo_project.yml file

```
terraform plan -var "yaml_file=./demo_project/demo_project.yml" -var-file=".tfvars" -state="./demo_project/demo_project.tfstate"

terraform apply -var "yaml_file=./demo_project/demo_projecy.yml" -var-file=".tfvars" -state=".ß/demo_project/demo_project.tfstate"
```