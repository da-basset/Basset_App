resource "aws_internet_gateway" "GW" {
  vpc_id = var.Internet_Gateway
}