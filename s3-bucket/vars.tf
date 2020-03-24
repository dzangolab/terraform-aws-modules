variable "bucket_arns" {
  default     = []
  description = "ARNs of buckets to add to the policy"
  type        = list(string)
}

variable "groups" {
  default     = []
  description = "Groups to attach policy to"
  type        = list(string)
}

variable "policy_name" {
  description = "Name of policy to be seen on console"
  type        = string
}

variable "users" {
  default     = []
  description = "Users to attach policy to"
  type        = list(string)
}
