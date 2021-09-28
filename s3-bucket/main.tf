data "aws_iam_policy_document" "s3_bucket" {
  version = "2012-10-17"

  statement {
    sid = "dzangolab.terraform-aws-modules-s3-bucket-0"

    effect = "Allow"

    actions = [
      "s3:ListBucket"
    ]

    resources = [
      "${aws_s3_bucket.this.arn}",
    ]
  }

  statement {
    sid = "dzangolab.terraform-aws-modules-s3-bucket-1"

    effect = "Allow"

    actions = [
      "s3:DeleteObject",
      "s3:GetObject",
      "s3:PutObject"
    ]

    resources = [
      "${aws_s3_bucket.this.arn}/*",
    ]
  }
}

resource "aws_s3_bucket" "this" {
  bucket = var.name
  acl  = "private"
}

resource "aws_iam_policy" "bucket_policy" {
  name   = join("-", ["s3", var.name])
  policy = data.aws_iam_policy_document.s3_bucket.json
}

resource "aws_iam_group_policy_attachment" "group_attachments" {
  count = length(var.groups)

  group = element(var.groups, count.index)

  policy_arn = aws_iam_policy.bucket_policy.arn
}

resource "aws_iam_role_policy_attachment" "role_attachments" {
  count = length(var.roles)

  role = element(var.roles, count.index)

  policy_arn = aws_iam_policy.bucket_policy.arn
}

resource "aws_iam_user_policy_attachment" "user_attachments" {
  count = length(var.users)

  user = element(var.users, count.index)

  policy_arn = aws_iam_policy.bucket_policy.arn
}
