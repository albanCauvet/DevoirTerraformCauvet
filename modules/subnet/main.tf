locals {
  subnet_name = var.subnet_name
}

data "aws_availability_zones" "AZ" {
  state = "available"
}

#Private subnet ###############
resource "aws_subnet" "subnet" {
  count                   = var.availability_zones
  vpc_id                  = var.vpc_id
  map_public_ip_on_launch = var.public_subnet
  cidr_block              = cidrsubnet(var.subnet_cidr_block, 4, count.index)
  availability_zone       = data.aws_availability_zones.AZ.names[count.index]

  tags = {
    Name = local.subnet_name
  }
}