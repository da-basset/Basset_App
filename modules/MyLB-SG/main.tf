resource "aws_security_group" "MyLB_SG_Resource" {
  name = "LB-SG"
  description = "The security group for the LB instance"
  vpc_id = var.LB_SG_VPC_ID

  tags = {
    name = "Control SG Access LB"
  }
}

resource "aws_security_group_rule" "SG_LB_Inbound_Rule" {
  security_group_id = aws_security_group.MyLB_SG_Resource.id
  type = "ingress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = [var.LB_Public_SG_VPC_CIDR_Block]
}

resource "aws_security_group_rule" "SG_LB_SSH_Rule" {
  security_group_id = aws_security_group.MyLB_SG_Resource.id
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "SG_LB_Outbound_Rule" {
  security_group_id = aws_security_group.MyLB_SG_Resource.id
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}