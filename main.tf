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

module "launch_config" {
    source = "./Launch_configuration"
    vpc_security_group_ids = ["${module.sg.sg_id}"]

}

module "elb" {
    source = "./ELB"
    vpc_security_group_ids = ["${module.sg.sg_id}"]

}