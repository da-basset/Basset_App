variable "EC2_SG_VPC_ID" {
  description = "Grab the VPC ID for the EC2 Security Group"
  type = string
}

variable "EC2_Public_SG_VPC_CIDR_Block" {
  description = "Grab the Public Subnet from the VPC module"
  type = string
}