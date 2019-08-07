resource "aws_iam_policy" "readwrite_secret_policy" {
  name   = var.policy_name
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
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
            ],
            "Resource": [
              "${join(",\n", var.secret_arns)}"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "secretsmanager:GetRandomPassword",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_group_policy_attachment" "readwrite_secret_policy_group_attachment" {
  count = length(var.groups)

  group = element(var.groups, count.index)

  policy_arn = aws_iam_policy.readwrite_secret_policy.arn
}

resource "aws_iam_user_policy_attachment" "readwrite_secret_policy_attachment" {
  count = length(var.users)

  user = element(var.users, count.index)

  policy_arn = aws_iam_policy.readwrite_secret_policy.arn
}
