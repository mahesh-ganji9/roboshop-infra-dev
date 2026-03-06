terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.33.0"
    }
  }

  backend "s3" {
    encrypt      = true
    bucket       = "terraform-devops88s"
    key          = "terraform-devops88s-sg.tfstate"
    use_lockfile = true
    region       = "us-east-1"
  }

}
provider "aws" {
  region = "us-east-1"
}
