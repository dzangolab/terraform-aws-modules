variable "policy_name" {
  description = "Name of policy to be seen on console"
  type        = string
}

variable "secret_arns" {
  description = "ARNs of secrets to add to the policy"
  default     = []
  type        = list(string)
}

variable "users" {
  description = "Users to attach policy to"
  default     = []
  type        = list(string)
}
