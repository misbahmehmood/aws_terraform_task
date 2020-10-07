esource "aws_vpc" "terraform_vpc" {
    cidr_block = var.cidr_block
    enable_dns_hostnames = var.enable_dns_hostname

    tags = {
        Name = "terraformVPC"
    }
}

data "aws_availability_zones" "available" {
    state = "available"
}

resource "aws_subnet" "subnet-1" {
    cidr_block = var.cidr1
    availability_zone = data.aws_availability_zones.available.names[0]
    vpc_id = aws_vpc.terraform_vpc.id
    map_public_ip_on_launch = true

} 

resource "aws_subnet" "subnet-2" {
    cidr_block = var.cidr2
    availability_zone = data.aws_availability_zones.available.names[1]
    vpc_id = aws_vpc.terraform_vpc.id
    map_public_ip_on_launch = true

} 

resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.terraform_vpc.id

    tags = {
        Name = "Gateway"
    }
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.terraform_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }

    tags = {
        Name = "rt"

    }
}
resource "aws_route_table_association" "sub1" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.rt.id

}

resource "aws_route_table_association" "sub2" {
  subnet_id      = aws_subnet.subnet-2.id
  route_table_id = aws_route_table.rt.id

}
