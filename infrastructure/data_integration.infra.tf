variable "user_home" {
  default                 = "/home/deepak"
}

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
  key_name              = "DeepakKhanal"

  connection {
    "user" = "deepak"
    "private_key" = "${var.user_home}/DeepakKhanalAWSKey.pem"
  }

  provisioner "remote-exec" {
    inline = [
      "git clone https://github.com/dkhanal/data_integration.git ~/data_integration",
      "~/data_integration/infrastructure/scripts/installer-docker.sh"
    ]
  }
}