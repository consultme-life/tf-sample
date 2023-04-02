# resource "aws_eks_fargate_profile" "eks_fargate_profile" {
#   depends_on = [
#     aws_eks_cluster.eks_cluster
#   ]
#   cluster_name           = aws_eks_cluster.eks_cluster.name
#   fargate_profile_name   = "${local.tags["name"]}-fargate-profile"
#   pod_execution_role_arn = aws_iam_role.fargate-role.arn
#   subnet_ids             = [for subnet in aws_subnet.private_subnet : subnet.id]

#   selector {
#     namespace = "sample"
#   }
# }

# resource "aws_iam_role" "fargate-role" {
#   name = "${local.tags["name"]}-eks"

#   assume_role_policy = jsonencode({
#     Statement = [{
#       Action = "sts:AssumeRole"
#       Effect = "Allow"
#       Principal = {
#         Service = "eks-fargate-pods.amazonaws.com"
#       }
#     }]
#     Version = "2012-10-17"
#   })
# }

# resource "aws_iam_role_policy_attachment" "AmazonEKSFargatePodExecutionRolePolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
#   role       = aws_iam_role.fargate-role.name
# }