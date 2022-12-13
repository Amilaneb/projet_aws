# Create a VPC
resource "aws_vpc" "demo" {
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "day1"
  }
}

# Create public Subnets
resource "aws_subnet" "public-a" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = "10.0.0.0/26"
  availability_zone = "us-east-1c"

  tags = {
    Name = "public-a"
  }
}

resource "aws_subnet" "public-b" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = "10.0.0.64/26"
  availability_zone = "us-east-1b"

  tags = {
    Name = "public-b"
  }
}

# Create private Subnets
resource "aws_subnet" "private-a" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = "10.0.0.128/26"
  availability_zone = "us-east-1c"

  tags = {
    Name = "private-a"
  }
}

resource "aws_subnet" "private-b" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = "10.0.0.192/26"
  availability_zone = "us-east-1b"

  tags = {
    Name = "private-b"
  }
}