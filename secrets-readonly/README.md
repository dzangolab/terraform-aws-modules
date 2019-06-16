# Terraform plan for AWS secrets with read-only policy

This terraform module helps to apply read-only IAM policy to secrets created on AWS Secrets Manager for certain AWS users.

Refer `vars.tf` variable file for available input options and default values.

You can see Amazon Resource Name(ARN) of a secret by going to detail of secret on AWS console and refer to `Secret ARN` field.
