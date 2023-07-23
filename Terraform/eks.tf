resource "aws_eks_cluster" "eks" {
  name     = "eks"
  version  = "1.24"
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private_subnet1.id,
      aws_subnet.private_subnet2.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.amazon_eks_cluster_policy]
}