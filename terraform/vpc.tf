provider "aws" {
  access_key="${var.aws_access_key}"
  secret_key="${var.aws_secret_key}"
  region = "${var.region}"
}

# ====================
# VPC
# ====================
resource "aws_vpc" "terraform-vpc" {
  cidr_block           = "10.0.0.0/16"

  tags = {
    Name = "terraform-vpc"
  }
}

# ====================
# Subnet
# ====================
resource "aws_subnet" "terraform-subnet-1" {
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-1a"
  vpc_id            = aws_vpc.terraform-vpc.id

  tags = {
    Name = "terraform-subnet-1"
  }
}

resource "aws_subnet" "terraform-subnet-2" {
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-1c"
  vpc_id            = aws_vpc.terraform-vpc.id

  tags = {
    Name = "terraform-subnet-2"
  }
}


# ====================
# Internet Gateway
# ====================
resource "aws_internet_gateway" "terraform-gateway" {
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    Name = "terraform-gateway"
  }
}

# ====================
# Route Table
# ====================
resource "aws_route_table" "terraform-table" {
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    Name = "terraform-table"
  }
}

resource "aws_route" "terraform-route" {
  gateway_id             = aws_internet_gateway.terraform-gateway.id
  route_table_id         = aws_route_table.terraform-table.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "terraform-route-subnet-1" {
  subnet_id      = aws_subnet.terraform-subnet-1.id
  route_table_id = aws_route_table.terraform-table.id
}

resource "aws_route_table_association" "terraform-route-subnet-2" {
  subnet_id      = aws_subnet.terraform-subnet-2.id
  route_table_id = aws_route_table.terraform-table.id
}

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
