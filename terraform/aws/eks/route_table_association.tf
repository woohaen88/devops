resource "aws_route_table_association" "my-route-association-pub-sub1" {
  route_table_id = aws_route_table.my-route-table-pub-sub1.id
  subnet_id      = aws_subnet.public-subent-01.id
}

resource "aws_route_table_association" "my-route-association-pub-sub2" {
  route_table_id = aws_route_table.my-route-table-pub-sub2.id
  subnet_id      = aws_subnet.public-subnet-02.id
}
