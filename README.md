### This Terraform deploy an APP in AWS ECS Fargate:

* Create ECS Task Definition
* Create ECS Service Fargate
* Create Application Load Balance
* Create Target Group
* Create Monitoring Log in AWS CloudWatch

## Usage
##### Credential for AWS
Create .env file to AWS credentials with access key and secret key.
```shell
# AWS environment
AWS_ACCESS_KEY_ID=your-access-key-here
AWS_SECRET_ACCESS_KEY=your-secret-key-here
```

## Terraform inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws\_region | The AWS region to deploy.. | string | `"us-east-2"` | yes |
| az\_count | The number of Availability Zones that we will deploy into. | string | `"2"` | no |
| environment | Name of environment to be created | string | n/a | yes |
| vpc\_cidr\_block | Range of IPv4 address for the VPC. | string | `"10.10.0.0/16"` | no |
| default\_tags | Default tags name. | map | `"Key: value"` | yes |

## Terraform Outputs

| Name | Description |
|------|-------------|
| ecs_cluster_name | ECS cluster name. |
| aws\_vpc\_id | The ID of AWS VPC created for the ECS cluster. ||