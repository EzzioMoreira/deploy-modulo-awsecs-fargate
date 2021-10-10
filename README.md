### This Terraform Call Module Terraform and deploy an APP in AWS ECS Fargate:

* Create ECS Task Definition
* Create ECS Service Fargate
* Create Application Load Balance
* Create Target Group

#### Requisites for running this project:
- Docker
- Docker-compose
- Make
- AWS CLI version 2

## Usage
##### Credential for AWS
Create .env file to AWS credentials with access key and secret key.
```shell
# AWS environment
AWS_ACCESS_KEY_ID=your-access-key-here
AWS_SECRET_ACCESS_KEY=your-secret-key-here
```
#### The visual representation
```shell
# run the command for terraform shell
make terraform-sh

# and then install apk graphviz
apk -U add graphviz

# Command is used to generate a visual representation
terraform graph | dot -Tsvg > graph.svg
```
#### For help, run the following commands: ```make help```:
##### Print:

```make
make help          ## Run make help.
docker-run-local   ## Run the container on the local machine.
docker-stop-local  ## Destroy the container on the local machine.
ecr-build          ## ECR-step:1 Build your Docker image.
ecr-login          ## ECR-step:2 Retrieve an authentication token and authenticate your Docker client to your registry.
ecr-tag            ## ECR-step:3 Tag your image so you can push the image to this repository.
ecr-push           ## ECR-step:4 Push this image to your newly created AWS repository.
terraform-fmt      ## Command is used to rewrite Terraform configuration files to a canonical format and style.
terraform-init     ## Run terraform init to download all necessary plugins
terraform-plan     ## Exec a terraform plan and puts it on a file called plano
terraform-apply    ## Uses plano to apply the changes on AWS.
terraform-destroy  ## Destroy all resources created by the terraform file in this repo.
terraform-sh       ## Exec Terraform CLI.
```
