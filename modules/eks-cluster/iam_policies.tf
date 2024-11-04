# Thx GPT x https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment
resource "aws_iam_role" "eks_students_role" {
  name               = "EKS_Students" # Forced by Project requirement
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = [
            "eks.amazonaws.com",
            "ec2.amazonaws.com"
          ]
        }
      }
    ]
  })
}

# Dont do this in prod :)
resource "aws_iam_role_policy" "eks_students_policy" {
  name   = "${var.module_prefix}EKS_Students_Full_Policy"
  role   = aws_iam_role.eks_students_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "eks:*",
          "ec2:*",
          "iam:*",
          "cloudformation:*",
          "cloudwatch:*",
          "logs:*",
          "autoscaling:*",
          "elasticloadbalancing:*",
          "route53:*",
          "s3:*",
          "rds:*",
          "lambda:*",
          "sns:*",
          "sqs:*",
          "secretsmanager:*",
          "kms:*",
          "eks:TagResource",
          "eks:UntagResource",
          "eks:UpdateClusterConfig",
          "eks:UpdateClusterVersion"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.eks_students_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "eks_vpc_resource_controller" {
  role       = aws_iam_role.eks_students_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
}
