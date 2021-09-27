variable "name" {
  description = "Name of instance profile and role"
  type        = string
}

variable "policy_arns" {
  description = "ARNs of policies to attach to the role"
  type        = list(string)
}
