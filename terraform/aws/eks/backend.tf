resource "aws_s3_bucket" "s3-bucket" {
  bucket = var.s3-name
  tags = {
    "Name" = var.s3-name
  }
}








resource "aws_dynamodb_table" "my-ddb-tf-lock" {
  depends_on = [ aws_s3_bucket.s3-bucket ]
  name = var.dynamodb-name
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "${var.dynamodb-name}-20230703"
  }
}