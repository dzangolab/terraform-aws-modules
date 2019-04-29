# terraform-iam-policies

It contains terraform plan to apply certain IAM policies to multiple IAM users at once.

## Running terraform plan

### Initialize terraform

Change working directory based on which policy you want to apply.

```sh
cd directory-of-your-policy
terraform init
```

### Set values of input variables declared on `vars.tf` file

Refer `skeleton-develop.tfvars.example` and make similar `.tfvars` file, name it based on  your secret name. Refer `vars.tf` and update required input variables.

```sh
cp skeleton-develop.tfvars.example appname-env.tfvars
vi appname-env.tfvars
```

### Apply terraform plan(IAM policy)

```sh
terraform apply -var-file=appname-env.tfvars
```

### Destroy/undo terraform plan(IAM policy)

```sh
terraform destroy -var-file=appname-env.tfvars
```

### Validate terraform files(syntax check)

```sh
terraform validate -var-file=appname-env.tfvars
```
