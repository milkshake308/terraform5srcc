# Fetch the EKS cluster details
data "aws_eks_cluster" "eks" {
  name = var.cluster_name
}

# Fetch the EKS authentication token
data "aws_eks_cluster_auth" "eks" {
  name = var.cluster_name
}