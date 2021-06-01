resource "aws_security_group" "cloture" {
  name   = "SSH + Port 3005 for API"
  vpc_id = aws_vpc.main.id

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }

  # Allow 3005 traffic, to Docker image mapped to that port
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 3005
    to_port   = 3005
    protocol  = "tcp"
  }

  # Allow all outgoing traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
