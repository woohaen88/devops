resource "aws_subnet" "public-subnet-02" {
  depends_on = [
    aws_vpc.eks-vpc
  ]
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.32.0/20"
  enable_dns64                                   = "false"
  # enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  # map_customer_owned_ip_on_launch                = "true"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "public-subnet02"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
  }

  tags_all = {
    Name                                     = "public-subnet02"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
  }

  vpc_id = aws_vpc.eks-vpc.id
  availability_zone = "ap-northeast-2c"
}

resource "aws_subnet" "public-subent-01" {
  depends_on = [ aws_vpc.eks-vpc ]
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.0.0/20"
  enable_dns64                                   = "false"
  # enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  # map_customer_owned_ip_on_launch                = "true"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "public-subnet01"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
  }

  tags_all = {
    Name                                     = "public-subnet01"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
  }

  vpc_id = aws_vpc.eks-vpc.id
  availability_zone = "ap-northeast-2a"
}


resource "aws_subnet" "public-subnet-eks-pods-a" {
  depends_on = [ aws_vpc.eks-vpc ]
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "100.64.0.0/19"
  enable_dns64                                   = "false"
  # enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  # map_customer_owned_ip_on_launch                = "true"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "public-subnet-eks-pods-a"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
  }

  tags_all = {
    Name                                     = "public-subnet-eks-pods-a"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
  }

  vpc_id = aws_vpc.eks-vpc.id
  availability_zone = "ap-northeast-2a"
}

resource "aws_subnet" "public-subnet-eks-pods-c" {
  depends_on = [ aws_vpc.eks-vpc ]
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "100.64.32.0/19"
  enable_dns64                                   = "false"
  # enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  # map_customer_owned_ip_on_launch                = "true"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "public-subnet-eks-pods-c"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
  }

  tags_all = {
    Name                                     = "public-subnet-eks-pods-c"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
  }

  vpc_id = aws_vpc.eks-vpc.id
  availability_zone = "ap-northeast-2c"
}