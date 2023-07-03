resource "aws_internet_gateway" "my-internet-gateway" {
  tags = {
    Name = "kubernetes-eks-igw"
  }

  tags_all = {
    Name = "kubernetes-eks-igw"
  }

  vpc_id = aws_vpc.eks-vpc.id
}
