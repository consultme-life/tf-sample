resource "aws_eks_cluster" "eks_cluster" {
  name     = "${local.tags["name"]}-eks"
  role_arn = aws_iam_role.eks_role.arn
  vpc_config {
    subnet_ids             = [for subnet in aws_subnet.public_subnet : subnet.id]
    endpoint_public_access = "true"
    security_group_ids     = [aws_security_group.eks_sg.id]
  }
}