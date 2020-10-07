variable "ingress_ports" {
  type        = list(number)
  description = "List of ingress ports"
  default     = [22, 443, 80]
}


variable "cidr" {
    description     =   "CIDR block open to the internet"
    default         =   ["0.0.0.0/0"]
}

variable "outbound-port" {
    description     =   "Port open to allow outbound connection"
    default         =   "0"
}

variable "vpc_id" {
    description = "vpc id"
}