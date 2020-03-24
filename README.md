# terraform-aws-modules

A collection of Terraform [modules](https://www.terraform.io/docs/modules/index.html) to provision AWS resources.

## Requirements

- [Terraform](https://www.terraform.io) >= v0.12.0

## Using module

Every Terraform configuration has at least one module, known as its root module, which consists of the resources defined in the .tf files in the main working directory.

Add provider configuration in the root module as follows:

```hcl
provider "aws" {
  profile = "dzangolab"
  region  = "ap-southeast-1"
  version = "~> 2.16"
}
```

A terraform module can be used as a child module in your root module file as follows:

```hcl
module "arbritrary_name_to_refer_child_module" {
  source = "remote_or_local_path_to_module"

  input_variable1_of_module = "value1"
  input_variable2_of_module = "value2"
}
```

For example to use `secrets-readonly-policy` module,

```hcl
module "my_secrets_ro_policy" {
  source = "git::ssh://git@gitlab.united-asian.com/devops/terraform-aws-modules.git//secrets-readonly-policy?ref=1.0"

  policy_name = "my-secrets"
  secrets     = ["arn:aws:secretsmanager:ap-southeast-..."]
  users       = [ "alice", "bob" ]
}
```

## Adding another module

Refer to [this guide](https://www.terraform.io/docs/modules/index.html) to know how modules are created.
