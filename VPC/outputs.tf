output "vpc" {
    value = aws_vpc.terraform_vpc.id
}

output "subnet1_id" {
    value = aws_subnet.subnet-1.id
}


output "subnet2_id" {
    value = aws_subnet.subnet-2.id
}