variable "groups" {
  default     = []
  description = "Groups to attch policy to"
  type        = list(string)
}

variable "policy_name" {
  description = "Name of policy to be seen on console"
  type        = string
}

variable "secret_arns" {
  default     = []
  description = "ARNs of secrets to add to the policy"
  type        = list(string)
}

variable "users" {
  default     = []
  description = "Users to attach policy to"
  type        = list(string)
}
