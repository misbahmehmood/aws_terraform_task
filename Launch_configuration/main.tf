resource "aws_launch_configuration" "web" {
  image_id = var.ami 
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = var.vpc_security_group_ids
  associate_public_ip_address = true
  user_data                   = data.template_file.web_server.rendered

lifecycle {
    create_before_destroy = true
  }
}

data "template_file" "web_server" {
  template = file("./Launch_configuration/web_server.sh")
}
