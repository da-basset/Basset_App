resource "aws_elb" "TheELB_Resource" {
  
  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  subnets = [var.Public_Subnet_ID]
}