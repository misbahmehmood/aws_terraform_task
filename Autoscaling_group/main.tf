resource "aws_autoscaling_group" "terraform_asg" {
  name                      = "terraform_asg"
  min_size                  = 2
  desired_capacity          = 2
  max_size                  = 3

  health_check_grace_period = 300
  health_check_type         = "ELB"
  
  launch_configuration      = var.launch_config
  load_balancers = [var.load_balancer]
  vpc_zone_identifier       = [var.subnet1_id, var.subnet2_id]

  lifecycle {
      create_before_destroy = true
  }
}