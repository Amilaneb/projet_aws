output "dns" {
    value = aws_lb.alb.dns_name
}

output "ec2-instance" {
  value = [aws_instance.private-a.id, aws_instance.private-b.id]
}