# terraform-aws-modules

[Terraform modules](https://www.terraform.io/docs/modules/index.html) to provision AWS resources.

## Requirements

- [Terraform](https://www.terraform.io) >= v0.12.0

## Using module

Every Terraform configuration has at least one module, known as its root module, which consists of the resources defined in the .tf files in the main working directory.

A terraform module can be used as a child module in your root module file as follows:

```hcl
module "arbritray_name_to_refer_child_module" {
  source = "remote_or_local_path_to_module"

  input_variable1_of_module = "value1"
  input_variable2_of_module = "value2"
}
```

For example to use `secrets-readonly` module,

```hcl
module "myproject_secret_ro_policy" {
  source = "git::ssh://git@gitlab.united-asian.com/devops/terraform-aws-modules.git//secrets-readonly?ref=1.0"

  aws_profile = "dzangolab"
  aws_region  = "ap-southeast-1"
  policy_name = "myproject-develop-secrets"
  secret_arns = [
    "arn:aws:secretsmanager:ap-southeast-..."
  ]
  users       = [ "dzangolab-develop", "developer1", "developer2" ]
}
```

## Adding another module

Refer to [this guide](https://www.terraform.io/docs/modules/index.html) to know how modules are created.
