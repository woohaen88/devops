resource "aws_route_table" "my-route-table-pub-sub1" {

  depends_on = [ 
    aws_vpc.eks-vpc,
    aws_internet_gateway.my-internet-gateway
   ]
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-internet-gateway.id
  }

  tags = {
    Name = "public-subnet-routing1"
  }

  tags_all = {
    Name = "public-subnet-routing1"
  }

  vpc_id = aws_vpc.eks-vpc.id
}

resource "aws_route_table" "my-route-table-pub-sub2" {
  depends_on = [ 
    aws_vpc.eks-vpc,
    aws_internet_gateway.my-internet-gateway
   ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-internet-gateway.id
  }

  tags = {
    Name = "public-subnet-routing2"
  }

  tags_all = {
    Name = "public-subnet-routing2"
  }

  vpc_id = aws_vpc.eks-vpc.id
}

resource "aws_route_table" "my-rt-eks-pods-a" {

  depends_on = [ 
    aws_vpc.eks-vpc,
    aws_internet_gateway.my-internet-gateway
   ]
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-internet-gateway.id
  }

  tags = {
    Name = "my-rt-eks-pods-a"
  }

  tags_all = {
    Name = "my-rt-eks-pods-a"
  }

  vpc_id = aws_vpc.eks-vpc.id
}

resource "aws_route_table" "my-rt-eks-pods-c" {

  depends_on = [ 
    aws_vpc.eks-vpc,
    aws_internet_gateway.my-internet-gateway
   ]
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-internet-gateway.id
  }

  tags = {
    Name = "my-rt-eks-pods-c"
  }

  tags_all = {
    Name = "my-rt-eks-pods-c"
  }

  vpc_id = aws_vpc.eks-vpc.id
}