provider "aws" {
  version                 = "~> 2.8"
  region                  = var.region
  shared_credentials_file = "~/.aws/credentials"
}


module "vpc" {
  source = "./VPC"
}

module "sg" {
  source = "./SG"
  vpc_id = module.vpc.vpc

}