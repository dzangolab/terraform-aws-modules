data "aws_iam_policy_document" "terragrunt" {
  version = "2012-10-17"

  statement {
    sid = "AllowCreateAndListS3ActionsOnSpecifiedTerragruntBucket"

    effect = "Allow"

    actions = [
      "s3:ListBucket",
      "s3:GetBucketVersioning",
      "s3:CreateBucket"
    ]

    resources = var.bucket_arns
  }

  statement {
    sid = "AllowGetAndPutS3ActionsOnSpecifiedTerragruntBucketPath"

    effect = "Allow"

    actions = [
      "s3:PutObject",
      "s3:GetObject"
    ]

    resources = formatlist("%s/*", var.bucket_arns)
  }

  statement {
    sid = "AllowCreateAndUpdateDynamoDBActionsOnSpecifiedTerragruntTable"

    effect = "Allow"

    actions = [
      "dynamodb:PutItem",
      "dynamodb:GetItem"
      "dynamodb:DescribeTable",
      "dynamodb:DeleteItem",
      "dynamodb:CreateTable"
    ]

    resources = var.dynamodb_arns
  }
}

resource "aws_iam_policy" "terragrunt_policy" {
  name   = var.policy_name
  policy = data.aws_iam_policy_document.terragrunt.json
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
