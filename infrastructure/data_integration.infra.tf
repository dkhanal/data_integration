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
  ami                     = "ami-6e1a0117"
  instance_type           = "t2.micro"
  key_name                = "DeepakKhanal"
  security_groups         = ["DeepakResearchSG"]
      
  connection {
    "type"                = "ssh"
    "user"                = "ubuntu"
    "private_key"         = "${file("${var.user_home}/DeepakKhanalAWSKey.pem")}"
    "timeout"             = "10m"
  }
  provisioner "remote-exec" {
    inline = [
      "git clone https://github.com/dkhanal/data_integration.git ~/data_integration",
      "~/data_integration/infrastructure/scripts/install_docker.sh"
    ]
  }
}