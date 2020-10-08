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
    elb_security_group_ids = ["${module.sg.sg_id}"]
    subnet1_id       = module.vpc.subnet1_id
    subnet2_id      = module.vpc.subnet2_id

}

module "auto_scaling" {
    source = "./Autoscaling_group"
    launch_config = module.launch_config.launch_config_name
    load_balancer = module.elb.elb_id 
    subnet1_id       = module.vpc.subnet1_id
    subnet2_id      = module.vpc.subnet2_id
}