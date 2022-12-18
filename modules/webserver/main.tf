terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_subnet" "webserver" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block
  availability_zone = "us-west-2a"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_instance" "webserver" {
  ami               = var.ami  #us-east-1: found in "quickstart" after selecting launch ec2 instance
  instance_type     = var.instance_type
  key_name = "4days" 
  subnet_id         = aws_subnet.webserver.id
  tags = {
    Name            = "${var.webserver_name} webserver"
  }
}
