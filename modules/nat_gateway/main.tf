resource "aws_eip" "nat_eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.subnet_id

  tags = {
    Name = "nat-gateway"
  }
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gw.id
}
