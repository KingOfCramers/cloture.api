resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "Cloture's VPC"
  }
}

resource "aws_eip" "cloture" {
  instance = aws_instance.cloture.id
  vpc      = true
}
