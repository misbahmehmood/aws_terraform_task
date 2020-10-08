output "elb_id" {
    value = aws_elb.terraform_elb.id
}

output "elb_dns" {
    value = aws_elb.terraform_elb.dns_name
}