terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "cicd_server" {
  ami           = "ami-0f58b397bc5c1f2e9"
  instance_type = "t3.micro"

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y docker.io
              systemctl enable docker
              systemctl start docker
              EOF

  tags = {
    Name = "cicd-internship-server"
  }
}
