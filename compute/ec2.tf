resource "aws_instance" "private-a" {
  subnet_id = var.private-subnets[0]

  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  associate_public_ip_address = false

  vpc_security_group_ids = [aws_security_group.private.id]

  user_data = <<EOF
#!/bin/bash
yum -y update
yum -y install httpd
systemctl enable httpd
systemctl start httpd
echo '<html>Hello here!</html>' > /var/www/html/index.html
  EOF

  depends_on = [
    var.nat
  ]
}

resource "aws_instance" "private-b" {
  subnet_id = var.private-subnets[1]

  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  associate_public_ip_address = false

  vpc_security_group_ids = [aws_security_group.private.id]

  user_data = <<EOF
#!/bin/bash
yum -y update
yum -y install httpd
systemctl enable httpd
systemctl start httpd
echo '<html>Hello there!</html>' > /var/www/html/index.html
  EOF

  depends_on = [
    var.nat
  ]
}