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
