resource "aws_elb" "terraform_elb" {
  name = "terraform-elb"
  security_groups = var.elb_security_group_ids
  subnets = [var.subnet1_id, var.subnet2_id]
  
  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = "80"
    instance_protocol = "http"
  } 

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }

  tags = {
    Name = "terraform-elb"
  }

}
# waits 3 minutes before the output of the dns name to make sure instances are ready
resource "null_resource" "wait" {
    depends_on = [ aws_elb.terraform_elb ]
    triggers = {
      lb_dns_name = var.lb_dns_name
    }

    provisioner "local-exec" {
      command = "sleep 180"
    }
}

data "dns_a_record_set" "lb_dns_a" {
  depends_on = [null_resource.wait]
  host  = var.lb_dns_name
}