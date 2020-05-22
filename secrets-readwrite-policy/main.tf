data "aws_iam_policy_document" "secrets_readwrite" {
  version = "2012-10-17"

  statement {
    sid = "SecretsReadWrite0"

    effect = "Allow"

    actions = [
      "secretsmanager:GetResourcePolicy",
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret",
      "secretsmanager:RestoreSecret",
      "secretsmanager:PutSecretValue",
      "secretsmanager:DeleteSecret",
      "secretsmanager:RotateSecret",
      "secretsmanager:UpdateSecretVersionStage",
      "secretsmanager:CancelRotateSecret",
      "secretsmanager:ListSecretVersionIds",
      "secretsmanager:UpdateSecret"
    ]

    resources = var.secrets
  }

  statement {
    sid = "SecretsReadWrite1"

    effect = "Allow"

    actions = [
      "secretsmanager:GetRandomPassword",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "secrets_readwrite_policy" {
  name   = var.policy_name
  policy = data.aws_iam_policy_document.secrets_readwrite.json
}

resource "aws_iam_group_policy_attachment" "group_attachment" {
  count = length(var.groups)

  group = element(var.groups, count.index)

  policy_arn = aws_iam_policy.secrets_readwrite_policy.arn
}

resource "aws_iam_user_policy_attachment" "user_attachment" {
  count = length(var.users)

  user = element(var.users, count.index)

  policy_arn = aws_iam_policy.secrets_readwrite_policy.arn
}

resource "aws_iam_role_policy_attachment" "role_attachment" {
  count = length(var.roles)

  role       = element(var.roles, count.index)

  policy_arn = aws_iam_policy.secrets_readwrite_policy.arn
}
