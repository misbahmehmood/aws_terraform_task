resource "aws_security_group" "sg" {
    name = "instance_sg"
    description = "Allow inbound traffic"
    vpc_id = var.vpc_id


    dynamic "ingress" {
        iterator = port
        for_each = var.ingress_ports
        content {
            from_port = port.value
            protocol = "tcp"
            to_port = port.value
            cidr_blocks = var.cidr 
        }
        
    }

    egress {
        from_port = var.outbound-port
        protocol = "-1"
        to_port = var.outbound-port
        cidr_blocks = var.cidr
    }

    tags = {
        Name = "instance_sg"
    }  

}


resource "aws_security_group" "elb_sg" {
    name = "elb_sg"
    description = "Allow traffic to instances through Load Balancer"
    vpc_id = var.vpc_id

    ingress {
    from_port   = var.elb_port
    to_port     = var.elb_port
    protocol    = "tcp"
    cidr_blocks = var.cidr
  }

  egress {
    from_port       = var.outbound-port
    to_port         = var.outbound-port
    protocol        = "-1"
    cidr_blocks     = var.cidr
  }

  tags = {
    Name = "ELB Security Group"
  }
}