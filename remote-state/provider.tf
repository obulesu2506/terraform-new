terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = " ~> 5.84.0"
      }
    }

    backend "s3" {
        bucket = "82s-dont-tf-remote-state"
        key = "expense-backend-infra"
        region = "us-east-1"
        //dynamodb_table = "dont-state-locking" // This is commenting for validating alternate method
        encrypt = true
        use_lockfile = true  //This enables natively locked
      
    }
}
provider "aws" {
    #configuration options
    region = "us-east-1"
  
}