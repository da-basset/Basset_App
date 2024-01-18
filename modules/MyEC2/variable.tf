variable "EC2_Disk_Size" {
  description = "The Disk Size for EC2 instance"
  type = number
}

variable "EC2_Instance_Private_DNS" {
  description = "EC2 Module Variable for EC2 instance private DNS"
  type = string
} 

variable "EC2_SG_ID" {
  description = "The ID for the security group that'll be used for the EC2 instance"
  type = string
}