terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "5.84.0"
      }
    }

    backend "s3" {
        bucket = "dont-tf-remote-state"
        key = "expense-backend-infra"
        region = "us-east-1"
        dynamodb_table = "dont-state-locking"
      
    }
}
provider "aws" {
    #configuration options
    region = "us-east-1"
  
}