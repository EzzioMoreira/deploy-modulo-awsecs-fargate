provider "aws" {
  region  = "us-east-2"
  version = "= 3.0"
}
terraform {
  backend "s3" {
    bucket = "metal.corp-devops-test"
    key    = "app/webapp01-terraform-.tfstate"
    region = "us-east-2"
  }
} 
# "520044189785.dkr.ecr.us-east-2.amazonaws.com/$(APP_IMAGE):${APP_VERSION}
module "app-deploy" {
  source                 = "git@github.com:EzzioMoreira/modulo-awsecs-fargate.git?ref=master"
  containers_definitions = data.template_file.containers_definitions_json.rendered
  environment            = "development"
  app_name               = "website"
  app_port               = "80"
  cloudwatch_group_name  = "development-app"
  default_tags  = {
    Name        : "myapp",
    Team        : "IAC",
    Application : "App-Rapadura",
    Environment : "development",
    Terraform   : "Yes",
    Owner       : "Metal.Corp"
  }
}

#output "load_balancer_ip" {
#  value = module.app-deploy.aws_lb.main.ip
#}

data "template_file" "containers_definitions_json" {
  template = file("./containers_definitions.json")

  vars = {
    APP_VERSION = var.APP_VERSION
    APP_IMAGE   = var.APP_IMAGE
    ENVIRONMENT = "development"
    AWS_REGION  = var.aws_region
  }
}

variable "APP_VERSION" {
    default = "latest"
}

variable "APP_IMAGE" {
  default = "website"
}

variable "aws_region" {
  default = "us-east-2"
}