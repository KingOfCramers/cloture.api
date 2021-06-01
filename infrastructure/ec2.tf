resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = var.ssh_public_key
}

resource "aws_instance" "cloture" {
  ami               = var.instance_ami
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
  security_groups   = [aws_security_group.cloture.id]
  associate_public_ip_address = true
  subnet_id         = aws_subnet.cloture.id

  key_name = "ssh-key"

  ### Install Docker
  user_data = <<-EOF
  #!/bin/bash
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
  sudo usermod -aG docker ubuntu
  EOF

  tags = {
    Name = "Cloture_API"
  }
}
