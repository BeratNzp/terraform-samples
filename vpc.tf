resource "aws_vpc" "new_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "new_vpc"
  }
}

resource "aws_subnet" "new_vpc" {
  vpc_id     = aws_vpc.new_vpc.id
  cidr_block = "10.10.10.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "eu-central-1a-public"
  }
}

resource "aws_subnet" "new_vpc" {
  vpc_id     = aws_vpc.new_vpc.id
  cidr_block = "10.10.11.0/24"
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

