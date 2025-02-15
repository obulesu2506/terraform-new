terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
  backend "s3" {
    bucket         = "82s-dont-tf-remote-state"
    key            = "vpc-test"
    region         = "us-east-1"
    dynamodb_table = "82s-dont-state-locking"

  }
}

provider "aws" {
  #configuration options
  region = "us-east-1"

}