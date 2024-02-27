resource "aws_vpc" "spotmusic_vpc" {
  cidr_block     = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
  Name = var.project_name + "-vpc"
 }
}

resource "aws_subnet" "spotmusic_subnet" {
  vpc_id         = aws_vpc.spotmusic_vpc.id
  cidr_block       = var.subnet_cidr_block
  map_public_ip_on_launch = true
  availability_zone   = var.region + "a"

  tags = {
  Name = var.project_name + "-subnet"
 }
}

output "vpc_id" {
  value = aws_vpc.spotmusic_vpc.id
}

output "subnet_id" {
  value = aws_subnet.spotmusic_subnet.id
}
