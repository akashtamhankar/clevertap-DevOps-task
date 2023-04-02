
provider "aws" {
  region = "ap-south-1"
  access_key= "confidential"
  secret_key= "confidential"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

