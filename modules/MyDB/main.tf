resource "aws_db_instance" "TheDB_Resource" {
  allocated_storage = 10
  db_name = "${var.DB_Name}"
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t3.micro"
  username = "${var.DB_Username}"
  password = "test12345"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.TheDB_Subnet_Group.name
}

resource "aws_db_subnet_group" "TheDB_Subnet_Group" {
  name = "bassetapp"
  subnet_ids = [ var.DB_subnet_group_public_subnet_id, var.DB_subnet_group_private_subnet_id ]
}