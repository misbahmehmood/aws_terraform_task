resource "aws_elb" "terraform_elb" {
  name = "terraform-elb"
  security_groups = var.vpc_security_group_ids
  subnets = [var.subnet1_id, subnet2_id]
  


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

  cross_zone_load_balancing   = true

}