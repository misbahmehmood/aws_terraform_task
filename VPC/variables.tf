variable "cidr_block" {
    description = "cidr block for VPC"
    default = "30.50.0.0/16"
}

variable "enable_dns_hostname" {
    description = "dns hostname"
    default = true 
}

variable "cidr1" {
    description = "cidr for subnet 1"
    default = "30.50.1.0/24"
}


variable "cidr2" {
    description = "cidr for subnet 2"
    default = "30.50.2.0/24"

}