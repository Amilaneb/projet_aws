resource "aws_security_group" "alb" {
  name        = "lb-public"
  description = "Allow HTTP inbound traffic"
  vpc_id      = var.vpc

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/24"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ALB SG"
  }
}


resource "aws_security_group" "private" {
  name        = "private"
  description = "Allow HTTP inbound traffic"
  vpc_id      = var.vpc

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/24"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Private EC2 SG"
  }
}