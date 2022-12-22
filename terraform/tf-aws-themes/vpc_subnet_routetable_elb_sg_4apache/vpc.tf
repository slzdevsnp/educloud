# VPC
resource "aws_vpc" "terra_vpc" {
  cidr_block       = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

# Internet Gateway to allow  outboudnd requests to internet
resource "aws_internet_gateway" "terra_igw" {
  vpc_id = aws_vpc.terra_vpc.id
  tags = {
    Name = "main"
  }
}
# Subnets : public 
resource "aws_subnet" "public" {
  count = length(var.subnets_cidr)
  vpc_id = aws_vpc.terra_vpc.id
  cidr_block = var.subnets_cidr[count.index]
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "sub-terra-${count.index+1}"
  }
}

# Route table: in vpc terra attach Internet Gateway 
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.terra_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terra_igw.id
  }
  tags = {
    Name = "backendRouteTable"
  }
}

# Route table associate it with  with 2   subnets
resource "aws_route_table_association" "a" {
  count = length(var.subnets_cidr)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public_rt.id
}


