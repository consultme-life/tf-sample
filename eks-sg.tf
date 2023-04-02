resource "aws_security_group" "eks_sg" {
  depends_on = [
    aws_vpc.my_vpc
  ]
  name        = "${local.tags["name"]}-eks-sg"
  description = "SG for EKS Master"
  vpc_id      = aws_vpc.my_vpc.id

  tags = {
    Name = "${local.tags["name"]}-eks-sg"
  }
}