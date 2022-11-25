resource "aws_vpc" "new_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "new_vpc"
  }
}

resource "aws_subnet" "eu-central-1a-public" {
  vpc_id     = aws_vpc.new_vpc.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "eu-central-1a-public"
  }
}

resource "aws_subnet" "eu-central-1a-private" {
  vpc_id     = aws_vpc.new_vpc.id
  cidr_block = "10.0.11.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "eu-central-1a-private"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.new_vpc.id

  tags = {
    Name = "new_vpc"
  }
}

resource "aws_route_table" "new_vpc_public_route_table" {
  vpc_id = aws_vpc.new_vpc.id

  tags = {
    Name = "new_vpc_public_route_table"
  }
}