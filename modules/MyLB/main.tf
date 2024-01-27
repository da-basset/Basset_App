resource "aws_lb" "TheALB_Resource" {
  name = "AppLoadBalancer"
  internal = false
  load_balancer_type = "application"
  security_groups = [ var.LB-SG ]
  subnets = [var.Public_subnet_1, var.Public_subnet_2]
}

resource "aws_lb_target_group" "LB-TG" {
  name = "AppLoadBalancerTG"
  protocol = "HTTP"
  port = 80
  vpc_id = var.VPC_ID
}