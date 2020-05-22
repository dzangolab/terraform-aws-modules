data "aws_iam_policy_document" "secrets_readonly" {
  version = "2012-10-17"

  statement {
    sid = "SecretsReadonly0"

    effect = "Allow"

    actions = [
      "secretsmanager:GetResourcePolicy",
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret",
      "secretsmanager:ListSecretVersionIds"
    ]

    resources = var.secrets
  }

  statement {
    sid = "SecretsReadonly1"

    effect = "Allow"

    actions = [
      "secretsmanager:GetRandomPassword",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "secrets_readonly_policy" {
  name   = var.policy_name
  policy = data.aws_iam_policy_document.secrets_readonly.json
}

resource "aws_iam_group_policy_attachment" "group_attachment" {
  count = length(var.groups)

  group = element(var.groups, count.index)

  policy_arn = aws_iam_policy.secrets_readonly_policy.arn
}

resource "aws_iam_user_policy_attachment" "user_attachment" {
  count = length(var.users)

  user = element(var.users, count.index)

  policy_arn = aws_iam_policy.secrets_readonly_policy.arn
}

resource "aws_iam_role_policy_attachment" "role_attachment" {
  count = length(var.roles)

  role       = element(var.roles, count.index)

  policy_arn = aws_iam_policy.secrets_readonly_policy.arn
}
