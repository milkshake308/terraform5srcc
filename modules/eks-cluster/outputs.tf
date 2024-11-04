output "eks_cluster_id" {
  description = "EKS Cluster ID"
  value       = aws_eks_cluster.eks_cluster.id
}

output "eks_cluster_endpoint" {
  description = "EKS Cluster Endpoint"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "eks_cluster_role_arn" {
  description = "ARN of the cluster role"
  value       = aws_iam_role.eks_students_role.arn
}

output "eks_cluster_iam_policy_id" {
  description = "IAM cluster policy ID"
  value       = aws_iam_role.eks_students_role.id
}

output "eks_cluster_name" {
  description = "EKS Cluster name"
  value       = aws_eks_cluster.eks_cluster.name
}

output "eks_cluster_ca_data" {
  description = "EKS Certificate Authority data for kubeconfig."
  value       = aws_eks_cluster.eks_cluster.certificate_authority
}
