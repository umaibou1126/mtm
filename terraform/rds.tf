# ====================
# db_subnet_group
# ====================
resource "aws_db_subnet_group" "terraform-rds-subnet-group" {
  name        = "terraform-rds-subnet-group"
  description = "terraform-rds-subnet-group"
  subnet_ids  = [aws_subnet.terraform-subnet-1.id, aws_subnet.terraform-subnet-2.id]
}

# ====================
# db_instance
# ====================
resource "aws_db_instance" "terraform-rds" {
  identifier             = "terraform-rds"
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  username               = "test"
  password               = "password"
  parameter_group_name   = "default.mysql5.7"
  port                   = "3306"
  vpc_security_group_ids = [aws_security_group.terraform-security-group.id]
  db_subnet_group_name   = "${aws_db_subnet_group.terraform-rds-subnet-group.name}"
  skip_final_snapshot    = true
}
