resource "aws_s3_bucket" "test-woohyeon-eks-bucket" {
  depends_on = [ 
    aws_vpc.eks-vpc
   ]
  bucket        = var.s3-name
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
  bucket = var.s3-name

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
