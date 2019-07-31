provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
  version = "~> 2.16"
}

resource "aws_iam_policy" "readonly_secret_policy" {
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
                "secretsmanager:ListSecretVersionIds"
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

resource "aws_iam_user_policy_attachment" "secret_policy_attach" {
  count = length(var.users)

  user = element(var.users, count.index)

  policy_arn = aws_iam_policy.readonly_secret_policy.arn
}
