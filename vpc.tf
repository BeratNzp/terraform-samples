resource "aws_vpc" "new_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "new_vpc"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.new_vpc.id

  tags = {
    Name = "new_vpc_ig"
  }
}

resource "aws_default_route_table" "new_vpc_default_route_table" {
  default_route_table_id = aws_vpc.new_vpc.default_route_table_id

  tags = {
    Name = "new_vpc_private_route_table"
  }
}

resource "aws_route_table" "new_vpc_public_route_table" {
  vpc_id = aws_vpc.new_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "new_vpc_public_route_table"
  }
}

resource "aws_subnet" "eu_central_1a_public" {
  vpc_id     = aws_vpc.new_vpc.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "new_vpc_1a_public"
  }
}

resource "aws_route_table_association" "aws_public_route_table_association_process" {
  subnet_id      = aws_subnet.eu_central_1a_public.id
  route_table_id = aws_route_table.new_vpc_public_route_table.id
}

resource "aws_subnet" "eu_central_1a_private" {
  vpc_id     = aws_vpc.new_vpc.id
  cidr_block = "10.0.11.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "new_vpc_1a_private"
  }
}