variable "availability_zone" {
  description = "Availability zone of resources"
  type        = string
  default     = "us-east-1a"
}

variable "instance_ami" {
  description = "ID of the AMI used"
  type        = string
  default     = "ami-09e67e426f25ce0d7"
}

variable "instance_type" {
  description = "Type of the instance"
  type        = string
  default     = "t2.micro"
}

# Should be configured by the deployer to match key at ~/.ssh/your_public_key
variable "ssh_public_key" {
  description = "Public SSH key for logging into EC2 instance"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQy/pHHnlxKiTFRH/FAbAgtLA2GBS45bTNxrrSP+tqtF0TSe1j/NSKD3+C7GPmVNTOU2SDL3UIu71EfNcDtjRZ9O7AhJvNczOHRQ/gK7Pi88tkVjs5jHImJK3Fx/GgJ1jXCSfR5eD9CAhGBeYS21aq9SCOPDEzY3Pie0pP/KODnCILcdlbX9vVHf/LXXzY41dWEfobuAOjiJ03YjPhPCNCpl2axO0kLPOvkXTkiA8vrn2CpHW/0sy+a2WwaHEJrJ2QARdhrTIi6w8dQWK8AE5xp/vuiTTHCInY04e19m9CZwRi/TbUsyttVaw4DgG9mozxvu7CeC0FLJWE1JGHLBn/ harrisoncramer@myPc.local"
}
