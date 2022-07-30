# Set AWS as the provider 
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.14.0"  
    }
  }
# Use S3 bucket called 'manav-terraform-backend' as Terraform Backend
  backend "s3" {
    bucket = "manav-assignment-backend"
    key    = "private-key/upgrad-project.pem"
    region = "us-east-1"
  }
}

# Setup the AWS Provider Block
provider "aws" {
  region  = var.aws_region
}


