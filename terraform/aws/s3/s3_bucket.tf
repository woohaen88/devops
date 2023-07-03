resource "aws_s3_bucket" "test-woohyeon-eks-bucket" {
  bucket        = var.woohyeon-bucket-test-eks
  force_destroy = "false"

  object_lock_enabled = "false"


  tags = {
    eks = "stage"
  }

  tags_all = {
    eks = "stage"
  }

}

resource "aws_s3_bucket_public_access_block" "my-aws-s3-bucket-public-access-block" {
  bucket = var.woohyeon-bucket-test-eks 

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
