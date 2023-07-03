resource "aws_main_route_table_association" "my-main-route-table-association" {
  route_table_id = aws_route_table.my-route-table-pub-sub1.id
  vpc_id         = aws_vpc.eks-vpc.id
}
