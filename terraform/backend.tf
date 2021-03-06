provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
  profile    = "s3-profile"
}

terraform {
  backend "s3" {
    bucket                  = "XXX"
    key                     = "terraform.tfstate"
    region                  = "ap-northeast-1"
    shared_credentials_file = "~/.aws/XXX"
    profile                 = "s3-profile"
  }
}


