output "sg_id" {
  value = aws_security_group.sg.id
}

output "ELBsg_id" {
  value = aws_security_group.elb_sg.id
}