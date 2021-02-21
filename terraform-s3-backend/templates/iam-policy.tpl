{
  "Version": "2012-10-17",

  "Statement": [ 
    {
      "Sid": "AllowCreateAndListS3ActionsOnSpecifiedTerragruntBucket",
      "Effect": "Allow",
      "Action": [
        "s3:ListBucket",
        "s3:GetBucketVersioning"
      ],
      "Resource": "${bucket_arn}"
    },
    {
      "Sid": "AllowGetAndPutS3ActionsOnSpecifiedTerragruntBucketPath",
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject"
      ],
      "Resource": "${bucket_arn}/*"
    },
    {
      "Sid": "AllowCreateAndUpdateDynamoDBActionsOnSpecifiedTerragruntTable",
      "Effect": "Allow",
      "Action": [
        "dynamodb:PutItem",
        "dynamodb:GetItem",
        "dynamodb:DescribeTable",
        "dynamodb:DeleteItem"
      ],
      "Resource": "${dynamodb_table_arn}/*"
    },
    {
      "Action": "ec2:*",
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}