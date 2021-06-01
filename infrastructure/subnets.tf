resource "aws_subnet" "cloture" {
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 3, 1)
  vpc_id            = aws_vpc.main.id
  availability_zone = var.availability_zone
}

resource "aws_route_table" "cloture" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cloture.id
  }

  tags = {
    Name = "cloture"
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.cloture.id
  route_table_id = aws_route_table.cloture.id
}
