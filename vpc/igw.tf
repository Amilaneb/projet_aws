########################
### Internet Gateway ###
########################
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.demo.id

  tags = {
    Name = "main"
  }
}

#####################
#### NAT Gateway ####
#####################
resource "aws_eip" "nat" {
  vpc      = true
}

resource "aws_nat_gateway" "main" {

  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-a.id # arbitrary selected

  tags = {
    Name = "Demo NAT-Gateway"
  }

}