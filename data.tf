# Fetch the EKS cluster details
data "aws_eks_cluster" "eks" {
  name = var.cluster_name
  depends_on = [ module.eks-cluster ]
}

# Fetch the EKS authentication token
data "aws_eks_cluster_auth" "eks" {
  name = var.cluster_name
  depends_on = [ module.eks-cluster ]
}

data "external" "oidc_provider_fingerprint" {
  program = ["${path.module}/thumbprint.sh", var.aws_region]
}
