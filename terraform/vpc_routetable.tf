# ====================
# Route Table
# ====================
resource "aws_route_table" "terraform-table" {
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    Name = "terraform-table"
  }
}

resource "aws_route" "terraform-route" {
  gateway_id             = aws_internet_gateway.terraform-gateway.id
  route_table_id         = aws_route_table.terraform-table.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "terraform-route-subnet-1" {
  subnet_id      = aws_subnet.terraform-subnet-1.id
  route_table_id = aws_route_table.terraform-table.id
}

resource "aws_route_table_association" "terraform-route-subnet-2" {
  subnet_id      = aws_subnet.terraform-subnet-2.id
  route_table_id = aws_route_table.terraform-table.id
}
