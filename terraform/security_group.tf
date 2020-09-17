# ====================
# Security Group
# ====================
resource "aws_security_group" "terraform-security-group" {
  vpc_id = aws_vpc.terraform-vpc.id
  name   = "terraform-security-group"

  tags = {
    Name = "terraform-security-group"
  }
}

# インバウンドルール(HTTP)
resource "aws_security_group_rule" "in_http" {
  security_group_id = aws_security_group.terraform-security-group.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
}

# インバウンドルール(HTTPS)
resource "aws_security_group_rule" "in_https" {
  security_group_id = aws_security_group.terraform-security-group.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
}

# インバウンドルール(SSH)
resource "aws_security_group_rule" "in_ssh" {
  security_group_id = aws_security_group.terraform-security-group.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
}

# インバウンドルール(RDS)
resource "aws_security_group_rule" "in_rds" {
  security_group_id = aws_security_group.terraform-security-group.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
}


# アウトバウンドルール
resource "aws_security_group_rule" "out_all" {
  security_group_id = aws_security_group.terraform-security-group.id
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
}
