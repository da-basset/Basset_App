variable "Public_Subnet_ID" {
  description = "Get the VPC Public Subnet ID"
  type = string
}

variable "LB-SG" {
  description = "The security group for load balancer"
  type = string
}

variable "Public_subnet_1" {
  description = "The public Subnet 1 form VPC for LB"
  type = string
}

variable "Public_subnet_2" {
  description = "The public Subnet 2 form VPC for LB"
  type = string
}