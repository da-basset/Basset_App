provider "aws" {
  region = "us-west-2"
}

module "TheDB" {
  source = "./modules/MyDB"

  DB_Name = var.Name_Of_DB
  DB_Username = var.Username_Of_DB
  DB_subnet_group_public_subnet_id = module.TheVPC.Public_Subnet_ID
  DB_subnet_group_private_subnet_id = module.TheVPC.Private_Subnet_ID
  DB_subnet_group_public_subnet_id_2 = module.TheVPC.Private_Subnet_ID_2
  DB_subnet_group_private_subnet_id_2 = module.TheVPC.Public_Subnet_ID_2
}

module "TheEC2" {
  source = "./modules/MyEC2"

  EC2_Disk_Size = var.Disk_Size_Choice
  EC2_SG_ID = module.TheEC2-SG.Output_EC2_SG_ID
  EC2_instance_public_subnet = module.TheVPC.Public_Subnet_ID
  EC2_Instance_Private_subnet = module.TheVPC.Private_Subnet_ID

  depends_on = [ module.TheInternetGateway ]

}
module "TheEC2-2" {
  source = "./modules/MyEC2-2"

  EC2_Disk_Size = var.Disk_Size_Choice
  EC2_SG_ID = module.TheEC2-SG.Output_EC2_SG_ID
  EC2_instance_private_subnet_2 = module.TheVPC.Private_Subnet_ID_2
  EC2_instance_public_subnet_2 = module.TheVPC.Public_Subnet_ID_2
}


module "TheEC2-SG" {
  source = "./modules/MyEC2-SG"

  EC2_SG_VPC_ID = module.TheVPC.TheVPC_ID
  EC2_Public_SG_VPC_CIDR_Block = module.TheVPC.Output_TheVPC_Resource_Public_Subnet_CIDR_Block
}

module "TheLB" {
  source = "./modules/MyLB"

  Public_Subnet_ID = module.TheVPC.Public_Subnet_ID
  LB-SG = module.TheLB-SG.Output_LB_SG_ID
  Public_subnet_1 = module.TheVPC.Public_Subnet_ID
  Public_subnet_2 = module.TheVPC.Public_Subnet_ID_2
  VPC_ID = module.TheVPC.TheVPC_ID
}

module "TheLB-SG" {
  source = "./modules/MyLB-SG"

  LB_SG_VPC_ID = module.TheVPC.TheVPC_ID
  LB_Public_SG_VPC_CIDR_Block = module.TheVPC.Output_TheVPC_Resource_Public_Subnet_CIDR_Block
}

module "TheVPC" {
  source = "./modules/MyVPC"
  
}

module "TheInternetGateway" {
  source = "./modules/MyInternetGateway"
  
  Internet_Gateway = module.TheVPC.TheVPC_ID
}
