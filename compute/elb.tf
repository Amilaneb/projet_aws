resource "aws_lb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = [var.public-subnets[0], var.public-subnets[1]]

  enable_deletion_protection = false

  tags = {
    Environment = "dev"
  }
}

resource "aws_lb_target_group" "front_end" {
  name     = "target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc
  target_type = "instance"
}

resource "aws_lb_target_group_attachment" "instance-a" {
  target_group_arn = aws_lb_target_group.front_end.arn
  target_id        = aws_instance.private-a.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "instance-b" {
  target_group_arn = aws_lb_target_group.front_end.arn
  target_id        = aws_instance.private-b.id
  port             = 80
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_end.arn
  }
}