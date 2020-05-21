variable "groups" {
  default     = []
  description = "Groups to attach policy to"
  type        = list(string)
}

variable "policy_name" {
  description = "Name of policy"
  type        = string
}

variable "roles" {
  default     = []
  description = "IAM roles to attach policy to"
  type        = list(string)
}

variable "secrets" {
  default     = []
  description = "ARNs of secrets to add to the policy"
  type        = list(string)
}

variable "users" {
  default     = []
  description = "Users to attach policy to"
  type        = list(string)
}
