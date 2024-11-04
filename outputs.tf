output "vpc_id" {
  description = "VPC ID"
  value       = module.core-compute.vpc_id
}

output "ec2_security_group_id" {
  description = "ID of Security Group"
  value       = module.core-compute.ec2_security_group_id
}
output "public_subnet_ids" {
  description = "ID of Public Subnets"
  value       = module.core-compute.public_subnet_ids
}

output "public_internet_gateway_id" {
  description = "ID of Internet Gateway"
  value       = module.core-compute.public_internet_gateway_id
}

output "private_subnet_ids" {
  description = "ID of Private Subnets"
  value       = module.core-compute.private_subnet_ids
}

output "private_nat_gateway_id" {
  description = "ID of Nat Gateway"
  value       = module.core-compute.private_nat_gateway_id
}

output "private_nat_gateway_public_ip" {
  description = "Public IP address of NAT GW"
  value       = module.core-compute.private_nat_gateway_public_ip
}

output "eks_cluster_id" {
  description = "EKS Cluster ID"
  value       = module.eks-cluster.eks_cluster_id
}

output "eks_cluster_role_arn" {
  description = "ARN of the cluster role"
  value       = module.eks-cluster.eks_cluster_role_arn
}

output "eks_cluster_name" {
  description = "EKS Cluster name"
  value       = module.eks-cluster.eks_cluster_name
}

output "eks_cluster_ca_data" {
  description = "EKS Certificate Authority data for kubeconfig."
  value       = module.eks-cluster.eks_cluster_ca_data
}

output "eks_cluster_endpoint" {
  description = "EKS Cluster Endpoint"
  value       = module.eks-cluster.eks_cluster_endpoint
}
