terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
  backend "s3" {
    bucket         = "82s-dont-tf-remote-state"
    key            = "sg-test" #unique key should be required since same key within the same bucket shouldn't use for other tf projects
    region         = "us-east-1"
    dynamodb_table = "82s-dont-state-locking"
  }
}

provider "aws" {
  #configuration options
  region = "us-east-1"

}