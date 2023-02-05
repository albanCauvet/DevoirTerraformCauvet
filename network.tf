#Public Route table ###############
resource "aws_route_table" "public" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "public_route_table"
  }
}


#To avoid the conflict with  the main table
resource "aws_route_table_association" "public" {
  subnet_id      = module.subnet["front"].subnet_id[0]
  route_table_id = aws_route_table.public.id
}

#Internet gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = module.vpc.vpc_id

  tags = {
    Name = "Internet-gateway"
  }
}