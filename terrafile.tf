provider "aws" {
  region  = "us-east-2"
  version = "= 3.0"
}
terraform {
  backend "s3" {
    bucket = "your-bucket-here"
    key    = "key-terraform-.tfstate"
    region = "us-east-2"
  }
} 

module "app-deploy" {
  source                 = "git@github.com:EzzioMoreira/modulo-awsecs-fargate.git?ref=v0.2"
  containers_definitions = data.template_file.containers_definitions_json.rendered
  environment            = "development"
  app_name               = "webapp"
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
  default = "app"
}

variable "aws_region" {
  default = "us-east-2"
}