resource "aws_iam_instance_profile" "my-aws-iam-instance-profile" {
  # name = random
  # eks-96c48d6a-2c79-680d-3b82-35af453e0c84
  path = "/"
  role = var.iam-nodegroup-name
}

