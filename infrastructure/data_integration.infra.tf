variable "region" {
  default                 = "us-west-2"
}

provider "aws" {
  region                  = "${var.region}"
  profile                 = "deepak.khanal@abbott.com"
}

resource "aws_instance" "example" {
  ami                   = "ami-6e1a0117"
  instance_type         = "t2.micro"
}
