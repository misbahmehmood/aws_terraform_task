variable "ami" {
  default = "ami-0823c236601fef765"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "new_key"
}

variable "vpc_security_group_ids" {
  default = "default value"
}