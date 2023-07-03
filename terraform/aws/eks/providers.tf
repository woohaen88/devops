terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket="woohyeon-bucket-test-eks"
    key="terraform.state"
    region = "ap-northeast-2"
    dynamodb_table = "my-ddb-f-lock"
    encrypt = true    
  }
  
}

provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {
  exclude_names = ["ap-northeast-2a","ap-northeast-2c"]
    # state = "available"
}