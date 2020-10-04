# ====================
# Security Group (app)
# ====================
resource "aws_security_group" "terraform-security-group-app" {
  vpc_id = aws_vpc.terraform-vpc.id
  name   = "terraform-security-group-app"

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["10.0.0.0/16"]
    security_groups = [aws_security_group.terraform-security-group-alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-security-group-app"
  }
}



# ====================
# Security Group（ALB）
# ====================
resource "aws_security_group" "terraform-security-group-alb" {
  name        = "terraform-security-group-alb"
  description = "terraform-security-group-alb"
  vpc_id      = aws_vpc.terraform-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-security-group-alb"
  }
}

# ====================
# Security Group (RDS)
# ====================
resource "aws_security_group" "terraform-security-group-rds" {
  name        = "terraform-security-group-rds"
  description = "terraform-security-group-rds"
  vpc_id      = aws_vpc.terraform-vpc.id
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.terraform-security-group-app.id]
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.2.0.0/16"]
    description = "terraform-security-group-rds"
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
<<<<<<< HEAD

=======
>>>>>>> 341d19adbcb1b503a97126c0fa3789a1789c057e
    cidr_blocks = ["52.193.147.240/28"]
    description = "terraform-security-group-rds"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "terraform-security-group-rds"
  }
}
