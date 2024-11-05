

resource "aws_iam_role" "alb_controller_role" {
  name               = "${var.module_prefix}ALBControllerRole"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
          Principal = {
            Federated = aws_iam_openid_connect_provider.eks_oidc.arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
        StringEquals = {
          "${local.strip_eks_oidc_uri}:aud": "sts.amazonaws.com",
          "${local.strip_eks_oidc_uri}:sub": "system:serviceaccount:kube-system:aws-load-balancer-controller"
        }
      }
      }
    ]
  })
}

resource "aws_iam_policy" "alb_controller_policy" {
  name        = "${var.module_prefix}-AWSLoadBalancerControllerIAMPolicy"
  description = "IAM policy for ALB Ingress Controller"
  policy      = file("${path.module}/aws_alb_iam_policy.json")
}

resource "aws_iam_role_policy_attachment" "alb_policy_attachment" {
  role       = aws_iam_role.alb_controller_role.name
  policy_arn = aws_iam_policy.alb_controller_policy.arn
}
