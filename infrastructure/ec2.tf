resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQy/pHHnlxKiTFRH/FAbAgtLA2GBS45bTNxrrSP+tqtF0TSe1j/NSKD3+C7GPmVNTOU2SDL3UIu71EfNcDtjRZ9O7AhJvNczOHRQ/gK7Pi88tkVjs5jHImJK3Fx/GgJ1jXCSfR5eD9CAhGBeYS21aq9SCOPDEzY3Pie0pP/KODnCILcdlbX9vVHf/LXXzY41dWEfobuAOjiJ03YjPhPCNCpl2axO0kLPOvkXTkiA8vrn2CpHW/0sy+a2WwaHEJrJ2QARdhrTIi6w8dQWK8AE5xp/vuiTTHCInY04e19m9CZwRi/TbUsyttVaw4DgG9mozxvu7CeC0FLJWE1JGHLBn/ harrisoncramer@myPc.local"
}

resource "aws_instance" "cloture" {
  ami               = var.instance_ami
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
  security_groups   = [aws_security_group.cloture.id]
  associate_public_ip_address = true
  subnet_id         = aws_subnet.cloture.id

  key_name = "ssh-key"

  tags = {
    Name = "Cloture_API"
  }
}
