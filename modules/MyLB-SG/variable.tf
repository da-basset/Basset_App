variable "LB_SG_VPC_ID" {
  description = "Grab the VPC ID for the LB Security Group"
  type = string
}

variable "LB_Public_SG_VPC_CIDR_Block" {
  description = "Grab the Public Subnet from the VPC module"
  type = string
}