variable "dynamodb_table_name" {
  description = "Name of DynamoDB table to use for remote state"
  type        = string
}

variable "dynamodb_billing_mode" {
  default = "PROVISIONED"
  description = "DynamoDB billing mode"
  type        = string
}

variable "dynamodb_read_capacity" {
  default = 20
  description = "DynamoDB read capacity"
  type        = number
}

variable "dynamodb_write_capacity" {
  default = 20
  description = "DynamoDB write capacity"
  type        = number
}

variable "iam_group" {
  description = "Name of IAM group"
  type = string
}

variable "s3_bucket" {
  description = "Name of S# bucket to use for remote state"
  type = string
}

variable "policy_name" {
  description = "Name of IAM policy"
  type = string
}
