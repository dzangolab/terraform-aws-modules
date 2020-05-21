resource "aws_iam_policy" "s3_bucket_policy" {
  name   = var.policy_name
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "S3Bucket0",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
              "${join(",\n", var.bucket_arns)}"
            ]
        },
        {
            "Sid": "S3Bucket1",
            "Effect": "Allow",
            "Action": [
              "s3:PutObject",
              "s3:GetObject",
              "s3:DeleteObject"
            ],
            "Resource": [
              "${join(",\n", formatlist("%s/*", var.bucket_arns))}"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_group_policy_attachment" "group_attachment" {
  count = length(var.groups)

  group = element(var.groups, count.index)

  policy_arn = aws_iam_policy.s3_bucket_policy.arn
}

resource "aws_iam_user_policy_attachment" "user_attachment" {
  count = length(var.users)

  user = element(var.users, count.index)

  policy_arn = aws_iam_policy.s3_bucket_policy.arn
}

resource "aws_iam_role_policy_attachment" "role_attachment" {
  count = length(var.roles)

  role       = element(var.roles, count.index)

  policy_arn = aws_iam_policy.s3_bucket_policy.arn
}
