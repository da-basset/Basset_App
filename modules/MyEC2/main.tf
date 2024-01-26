resource "aws_instance" "TheEC2_Resource" {
  count = 2
  instance_type = "t2.micro"
  key_name = "TopLevel"
  ami = "ami-0944e91aed79c721c" //Amazon Linux AMI 64-86bit
  //subnet_id = element(var.EC2_Instance_Private_subnet[*].id, count.index) == 0 ? var.EC2_Instance_Private_subnet.id : var.EC2_instance_public_subnet.id

  subnet_id = var.EC2_Instance_Private_subnet
  vpc_security_group_ids = [ var.EC2_SG_ID ]
  
  ebs_block_device {
    volume_type = "standard"
    volume_size = var.EC2_Disk_Size
    device_name = "/dev/sdf"
    delete_on_termination = true
    
    tags = {
      name = "My EBS for My EC2"
    }

  }

  tags = {
    //name = "The App EC2 instance with EBS"
    name = "The App EC2 instance with EBS ${count.index + 1}"
  }
}