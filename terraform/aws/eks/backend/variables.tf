

variable "s3-name" {
  default = "woohyeon-bucket-test-eks"
  type    = string
}

variable "aws_region" {
  default = "ap-northeast-2"
}

variable "dynamodb-name" {
  default = "my-ddb-f-lock"
  type = string
}