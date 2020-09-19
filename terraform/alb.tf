# ====================
# ALB
# ====================
resource "aws_alb" "terraform-alb" {
  name                       = "terraform-alb"
  security_groups            = [aws_security_group.terraform-security-group.id]
  subnets                    = [aws_subnet.terraform-subnet-1.id, aws_subnet.terraform-subnet-2.id]
  internal                   = false
  enable_deletion_protection = false
}

# ====================
# Target Group
# ====================
resource "aws_alb_target_group" "terraform-target-group" {
  name        = "terraform-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.terraform-vpc.id
  target_type = "ip"

  health_check {
    protocol            = "HTTP"
    path                = "/"
    port                = 80
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 10
    matcher             = 200
  }
}

# ====================
# ALB Listener HTTP
# ====================
resource "aws_alb_listener" "terraform-alb-http" {
  load_balancer_arn = aws_alb.terraform-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# ====================
# ALB Listener HTTPS
# ====================
resource "aws_alb_listener" "terraform-alb-https" {
  load_balancer_arn = aws_alb.terraform-alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2015-05"
  certificate_arn   = aws_acm_certificate.terraform-acm.arn

  default_action {
    target_group_arn = aws_alb_target_group.terraform-target-group.arn
    type             = "forward"
  }
}

# ====================
# listener_rule
# ====================
resource "aws_alb_listener_rule" "terraform-listener-rule" {
  listener_arn = aws_alb_listener.terraform-alb-http.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.terraform-target-group.arn
  }
  condition {
    path_pattern {
      values = ["*"]
    }
  }
}

# ====================
# ACM
# ====================
resource "aws_acm_certificate" "terraform-acm" {
  domain_name               = "portfoliough.com"
  subject_alternative_names = ["*.portfoliough.com"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}
