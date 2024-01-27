resource "aws_lb" "TheALB_Resource" {
  name = "AppLoadBalancer"
  internal = false
  load_balancer_type = "application"
  security_groups = [ var.LB-SG ]
  subnets = [var.Public_subnet_1, var.Public_subnet_2]
}