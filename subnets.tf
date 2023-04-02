resource "aws_subnet" "public_subnet" {
  depends_on = [
    aws_vpc.my_vpc
  ]
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = element(var.public_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${local.tags["name"]}-public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnet" {
  depends_on = [
    aws_vpc.my_vpc
  ]
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${local.tags["name"]}-private-subnet-${count.index + 1}"
  }
}