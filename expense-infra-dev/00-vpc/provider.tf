terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }

  backend "s3" {
    bucket         = "82s-dont-tf-remote-state-dev"
    key            = "expense-dev-vpc"
    region         = "us-east-1"
    dynamodb_table = "82s-dont-tf-remote-state-dev"
  }
}

provider "aws" {
  #configuration Options
  region = "us-east-1"

}