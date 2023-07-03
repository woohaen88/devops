
variable "aws_region" {
  default = "ap-northeast-2"
}

variable "cluster-name" {
  default = "test-eks-cluster"
  type    = string
}

variable "s3-name" {
  default = "woohyeon-bucket-test-eks"
  type    = string
}

variable "node-name" {
  default = "test-eks-nodegroup"
  type = string
}

variable "dynamodb-name" {
  default = "my-ddb-f-lock"
  type = string
}