terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region               = "us-east-1"

}

resource "aws_vpc" "my_vpc" {
  cidr_block           = "172.16.0.0/16"

  tags = {
    Name               = "tf-example"
  }
}

# when I call this module it is going to export a webserver module to output.tf
module "webserver_4days" {
    source             = "../modules/webserver"
    vpc_id             = aws_vpc.main.id
    cidr_block         = "172.16.0.0/16"
    webserver_name     = "Myles"
    ami                = "ami-0b5eea76982371e91"
    instance_type      = "t2.medium"
}

/*
output "instance_data" {
    value = module.webserver_4days.instance
  
}
# If I need to attach the webserver to a Load Balancer, I have to specify instances. The was I access the webserver I have to specify my module and output name.
resource "aws_elb" "main" {
    instances = module.webserver_4days.instance.id
  
}
/*
