resource "aws_iam_openid_connect_provider" "eks_oidc" {
  url             = var.eks_oidc_url
  client_id_list  = [ "sts.amazonaws.com" ]
  thumbprint_list = [ var.eks_oidc_provider_fingerprint ]
  tags = {
    "Name" = "${var.module_prefix}OIDC-Provider"
  }
}
