# Terraform S3 backend module

Provisions  the resources required to create a terraform remote backend on AWS using S3 and DynamoDB.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | ~> 3.27 |
| local | ~> 1.4.0 |
| template | ~> 2.1.2 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.27 |
| template | ~> 2.1.2 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_dynamodb_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) |
| [aws_iam_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) |
| [aws_iam_group_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) |
| [aws_iam_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) |
| [aws_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) |
| [template_file](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| dynamodb\_billing\_mode | DynamoDB billing mode | `string` | `"PROVISIONED"` | no |
| dynamodb\_read\_capacity | DynamoDB read capacity | `number` | `20` | no |
| dynamodb\_table\_name | Name of DynamoDB table to use for remote state | `string` | n/a | yes |
| dynamodb\_write\_capacity | DynamoDB write capacity | `number` | `20` | no |
| iam\_group | Name of IAM group | `string` | n/a | yes |
| policy\_name | Name of IAM policy | `string` | n/a | yes |
| s3\_bucket | Name of S# bucket to use for remote state | `string` | n/a | yes |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->