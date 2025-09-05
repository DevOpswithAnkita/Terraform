terraform {
  required_providers {
    aws = {       #The name of the provider you are using.
        source = "hashicorp/aws" # Where to get the provider from
        version = "6.12.0" # Version of the AWS provider
    }
  }
}

