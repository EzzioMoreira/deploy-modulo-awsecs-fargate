provider "aws" {
  region  = "us-east-2"
  version = "~> 3.0"
}

terraform {
  backend "s3" {
    bucket = "metal.corp-devops-test"
    key    = "app/webapp01-terraform-.tfstate"
    region = "us-east-2"
  }
}

module "app-deploy" {
  source                 = "git@github.com:EzzioMoreira/modulo-awsecs-fargate.git?ref=appname"
  containers_definitions = data.template_file.containers_definitions_json.rendered
  environment            = "development"
  app_name               = "website"
  app_port               = "80"
  fargate_version        = "1.4.0"
}

#output "load_balancer_dns_name" {
#  value = module.app-deploy.aws_alb.main.dns_name
#}

data "template_file" "containers_definitions_json" {
  template = file("./containers_definitions.json")

  vars = {
    APP_VERSION = var.APP_VERSION
    APP_IMAGE   = var.APP_IMAGE
  }
}

variable "APP_VERSION" {
    default   = "bead89c"
    describle = "Version comes from git commit in Makefile."
}

variable "APP_IMAGE" {
  default   = "website"
  describle = "Name comes from variable APP_IMAGE in Makefile"
}