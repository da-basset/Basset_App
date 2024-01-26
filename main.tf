provider "aws" {
  region = "us-west-2"
}

module "TheDB" {
  source = "./modules/MyDB"

  DB_Name = var.Name_Of_DB
  DB_Username = var.Username_Of_DB
  //DB_Subnet = module.TheVPC.Public_Subnet_ID
  DB_subnet_group_public_subnet_id = module.TheVPC.Public_Subnet_ID
  DB_subnet_group_private_subnet_id = module.TheVPC.Private_Subnet_ID
  DB_subnet_group_public_subnet_id_2 = module.TheVPC.Private_Subnet_ID_2
  DB_subnet_group_private_subnet_id_2 = module.TheVPC.Public_Subnet_ID_2
}

module "TheEC2" {
  // Make EC2 cluster, with 2-3 instances. To work with LB in correct fashion.
  source = "./modules/MyEC2"

  EC2_Disk_Size = var.Disk_Size_Choice
  EC2_SG_ID = module.TheEC2-SG.Output_EC2_SG_ID
  EC2_instance_public_subnet = module.TheVPC.Output_TheVPC_Resource_Public_Subnet_ID
  //EC2_Instance_Private_DNS = module.TheVPC.Output_TheVPC_Resource_Private_Subnet_ID
  // Add Variable for EC2 Name
  
  depends_on = [ module.TheInternetGateway ]

}

module "TheEC2-SG" {
  source = "./modules/MyEC2-SG"
  EC2_SG_VPC_ID = module.TheVPC.TheVPC_ID
  EC2_Public_SG_VPC_CIDR_Block = module.TheVPC.Output_TheVPC_Resource_Public_Subnet_CIDR_Block
}

module "TheLB" {
  source = "./modules/MyLB"
  Public_Subnet_ID = module.TheVPC.Public_Subnet_ID
  
}

module "TheVPC" {
  source = "./modules/MyVPC"
  // Add Variable for VPC Name
  
}

module "TheInternetGateway" {
  source = "./modules/MyInternetGateway"
  Internet_Gateway = module.TheVPC.TheVPC_ID
}
