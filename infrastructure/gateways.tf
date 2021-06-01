resource "aws_internet_gateway" "cloture" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "cloture"
  }
}
