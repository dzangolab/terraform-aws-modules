variable "aws_profile" {
  description = "AWS profile name used to create secret"
  default = "dzangolab"
}

variable "aws_region" {
  description = "AWS region on which secret is created"
  default = "ap-southeast-1"
}

variable "policy_name" {
  description = "Name of policy to be seen on console"
  type = "string"
}

variable "secret_arn" {
  description = "ARN of secret to apply policy to"
  type = "string"
}

variable "username" {
  description = "Name of users to attach policy to"
  default = ["semanta", "roshan", "uddhab"]
  type = "list"
}
