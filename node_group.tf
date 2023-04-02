# resource "aws_iam_role" "eks-node" {
#   name = "eks-node-group"

#   assume_role_policy = <<POLICY
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       },
#       "Action": "sts:AssumeRole"
#     }
#   ]
# }
# POLICY
# }

# resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
#   role       = aws_iam_role.eks-node.name
# }
# resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
#   role       = aws_iam_role.eks-node.name
# }
# resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
#   role       = aws_iam_role.eks-node.name
# }
# resource "aws_iam_instance_profile" "node" {
#   name = "terraform-eks-node"
#   role = aws_iam_role.eks-node.name
# }

# resource "aws_eks_node_group" "development-ng" {
#   depends_on = [
#     aws_eks_cluster.eks_cluster
#   ]
#   cluster_name    = aws_eks_cluster.eks_cluster.name
#   node_group_name = "${local.tags["name"]}-eks-ng"
#   node_role_arn   = aws_iam_role.eks-node.arn
#   subnet_ids      = [for subnet in aws_subnet.private_subnet : subnet.id]
#   disk_size       = "8"
#   capacity_type   = "ON_DEMAND"
#   scaling_config {
#     desired_size = 1
#     max_size     = 1
#     min_size     = 1
#   }
#   instance_types = ["t2.small"]
#   #   remote_access {
#   #     ec2_ssh_key               = "my_key_pair"
#   #     source_security_group_ids = ["sg-123456"]
#   #   }
#   tags = {
#     Name = "${local.tags["name"]}-eks-nodes"
#   }
# }