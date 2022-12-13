output "public-subnets" {
  value = [aws_subnet.public-a.id, aws_subnet.public-b.id]
}

output "private-subnets" {
  value = [aws_subnet.private-a.id, aws_subnet.private-b.id]
}

output "vpc" {
  value = aws_vpc.demo.id
}

output "nat" {
  value = aws_nat_gateway.main.id
}