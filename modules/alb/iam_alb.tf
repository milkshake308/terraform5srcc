resource "aws_iam_role" "alb_controller_role" {
  name               = "${var.module_prefix}-ALBControllerRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
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

