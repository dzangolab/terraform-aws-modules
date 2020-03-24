secrets_output "policy_name" {
  value = aws_iam_policy.secrets_readwrite_policy.name
}
