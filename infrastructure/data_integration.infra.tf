variable "user_home" {
  default                 = "/home/deepak"
}

variable "instance_key_name" {
  default                 = "DeepakKhanal"
}
variable "seurity_group" {
  default                 = "DeepakResearchSG"
}
variable "private_key_file" {
  default                 = "DeepakKhanalAWSKey.pem"  
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
  key_name                = "${var.instance_key_name}"
  security_groups         = ["${var.seurity_group}"]
      
  connection {
    "type"                = "ssh"
    "user"                = "ubuntu"
    "private_key"         = "${file("${var.user_home}/${var.private_key_file}")}"
    "timeout"             = "10m"
  }

  provisioner "remote-exec" {
    inline = [
      "git clone https://github.com/dkhanal/data_integration.git ~/data_integration",
      "chmod +x ~/data_integration/infrastructure/scripts/install_docker.sh
      "~/data_integration/infrastructure/scripts/install_docker.sh"
    ]
  }
}