resource "aws_dynamodb_table" "my-ddb-tf-lock" {
  depends_on = [ aws_s3_bucket.test-woohyeon-eks-bucket ]
  name = var.dynamodb-name
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "my-ddb-tf-lock"
  }
}