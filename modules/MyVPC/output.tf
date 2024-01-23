output "Output_TheVPC_Resource_Private_Subnet_ID" {
    value = aws_subnet.TheVPC_Resource_Private_Subnet.id
}

output "Output_TheVPC_Resource_Public_Subnet_CIDR_Block" {
    value = aws_subnet.TheVPC_Resource_Public_Subnet.cidr_block
}

output "Output_TheVPC_Resource_Private_Subnet_CIDR_Block" {
    value = aws_subnet.TheVPC_Resource_Private_Subnet.cidr_block
}

output "Public_Subnet_ID" {
  value = aws_subnet.TheVPC_Resource_Public_Subnet.id
}

output "Private_Subnet_ID" {
  value = aws_subnet.TheVPC_Resource_Private_Subnet.id
}

output "TheVPC_ID" {
  value = aws_vpc.TheVPC_Resource.id
}
