terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.84.0"
    }
  }

  backend "s3" {
    bucket = "82s-dont-tf-remote-state"
    key =  "module-demo" # you should have unique keys with in the bucket, same key should not be used in other repos or tf projects
    region = "us-east-1"
    dynamodb_table = "82s-dont-state-locking"
    
  }
}

provider "aws" {
    #Configuration Options
    region = "us-east-1"
  
}