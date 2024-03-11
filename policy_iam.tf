resource "aws_iam_policy" "example_policy" {
  name        = "example-policy"
  description = "An example IAM policy"

  policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Action    = "ec2:DescribeInstances",
        Resource  = "*"
      },
      {
        Effect    = "Allow",
        Action    = "ec2:StartInstances",
        Resource  = "*"
      },
      {
        Effect    = "Allow",
        Action    = "ec2:StopInstances",
        Resource  = "*"
      }
    ]
  })
}
