provider "aws" {
  region     = "${var.aws_region}"
  profile    = "${var.aws_profile}"
  version    = "~> 1.33"
}

data "aws_iam_policy_document" "readonly_secret_policy_doc" {
  statement {
    sid = "readonlysecretpolicy"

    effect = "Allow"

    actions = [
      "secretsmanager:GetResourcePolicy",
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret",
      "secretsmanager:ListSecretVersionIds",
    ]

    resources = [
      "${var.secret_arn}"
    ]
  }
}

resource "aws_iam_policy" "readonly_secret_policy" {
  name   = "${var.policy_name}"
  policy = "${data.aws_iam_policy_document.readonly_secret_policy_doc.json}"
}

resource "aws_iam_user_policy_attachment" "secret_policy_attach" {
  count = "${length(var.username)}"

  user = "${element(var.username, count.index)}"

  policy_arn = "${aws_iam_policy.readonly_secret_policy.arn}"
}
