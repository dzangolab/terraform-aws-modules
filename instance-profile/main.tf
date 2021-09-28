resource "aws_iam_instance_profile" "profile" {
  name = var.name
  role = aws_iam_role.role.name
}

resource "aws_iam_role" "role" {
  name = var.name
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attachment" {
  count      = length(var.policy_arns)
  policy_arn = var.policy_arns[count.index]
  role       = aws_iam_role.role.name
}
