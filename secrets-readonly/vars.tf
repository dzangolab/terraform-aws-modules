variable "aws_profile" {
  default = "dzangolab"
}

variable "aws_region" {
  default = "ap-southeast-1"
}

variable "policy_name" {
  type = "string"
}

variable "secret_arn" {
  type = "string"
}

variable "username" {
  type = "list"
  default = ["semanta", "roshan", "uddhab"]
}
