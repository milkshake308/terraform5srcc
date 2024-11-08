resource "aws_eks_node_group" "eks_node_group" {
  cluster_name            = var.cluster_name
  node_group_name_prefix  = var.cluster_name
  node_role_arn           = aws_iam_role.eks_students_role.arn
  capacity_type           = var.aws_ec2_capacity_type
  disk_size               = 20

  subnet_ids      = var.target_subnet_ids
  instance_types = [ var.eks_ec2_instance_type ]
  scaling_config {
    desired_size = var.scaling_desired_size
    max_size     = var.scaling_max_size
    min_size     = var.scaling_min_size
  }

  depends_on = [
    aws_eks_cluster.eks_cluster,
  ]
}
