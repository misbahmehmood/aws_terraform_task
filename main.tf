provider "aws" {
  version                 = "~> 2.8"
  region                  = var.region
  shared_credentials_file = "~/.aws/credentials"
}


module "vpc" {
  source = "./VPC"
}