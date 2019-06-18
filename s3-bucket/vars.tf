variable "aws_profile" {
  description = "AWS profile name used to create secret"
  default     = "dzangolab"
  type        = "string"
}

variable "aws_region" {
  description = "AWS region on which secret is created"
  default     = "ap-southeast-1"
  type        = "string"
}

variable "bucket_arns" {
  description = "ARNs of secrets to add to the policy"
  default     = []
  type        = "list"
}

variable "policy_name" {
  description = "Name of policy to be seen on console"
  type        = "string"
}

variable "users" {
  description = "Users to attach policy to"
  default     = []
  type        = "list"
}
