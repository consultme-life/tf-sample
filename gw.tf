resource "aws_internet_gateway" "igw" {
  depends_on = [
    aws_vpc.my_vpc
  ]
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "${local.tags["name"]}-igw"
  }
}


resource "aws_eip" "nat_eip" {
  vpc = true
  tags = {
    Name = "${local.tags["name"]}-nat-eip"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet[0].id
  tags = {
    Name = "${local.tags["name"]}-nat-gw"
  }
}