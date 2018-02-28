variable "client_platform" {
  default = "windows"
}

variable "user_dir" {
  type = "map"
  default = {
    "windows" = "%USERPROFILE%"
    "linux" = "$HOME"
  }
}

variable "ssh_profile" {
  type = "map"
  default = {
    "username" = "deepak"
    "private_key" = "${var.user_dir[var.client_platform]}/DeepakKhanalAWSKey.pem"
  }  
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

  connection {
    user = "ubuntu"
    private_key = "${var.ssh_profile[var.client_platform]}"
  }

  provisioner "remote-exec" {
    inline = [
      "git clone https://github.com/dkhanal/data_integration.git ~/data_integration",
      "~/data_integration/infrastructure/scripts/installer-docker.sh"
    ]
  }  
}