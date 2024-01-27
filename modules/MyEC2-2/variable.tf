variable "EC2_Disk_Size" {
  description = "The Disk Size for EC2 instance"
  type = number
}

variable "EC2_SG_ID" {
  description = "The ID for the security group that'll be used for the EC2 instance"
  type = string
}

variable "EC2_instance_public_subnet_2" {
  description = "The Public Subnet for the EC2 #2"
  type = string
}

variable "EC2_instance_private_subnet_2" {
  description = "The private Subnet for the EC2 #2"
  type = string
}