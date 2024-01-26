variable "DB_Name" {
  description = "The Variable to set the Database name"
  type = string
  default = "Default-DB-Name"
}

variable "DB_Username" {
  description = "The variable to set the Database Username"
  type = string
  default = "isaac"
}

variable "DB_subnet_group_public_subnet_id" {
  description = "The variable to set the database public subnet id"
  type = string
}

variable "DB_subnet_group_private_subnet_id" {
  description = "The variable to set the database private subnet id"
  type = string
}

variable "DB_subnet_group_public_subnet_id_2" {
  description = "The variable to set the database public subnet id AZ 2"
  type = string
}

variable "DB_subnet_group_private_subnet_id_2" {
  description = "The variable to set the database private subnet id AZ 2"
  type = string
}