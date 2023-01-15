#tfsec:ignore:aws-ec2-no-public-egress-sgr
#tfsec:ignore:aws-eks-no-public-cluster-access-to-cidr
#tfsec:ignore:aws-eks-no-public-cluster-access
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_public_access = var.cluster_endpoint_public_access

  cluster_addons            = var.cluster_addons
  vpc_id                    = var.vpc_id
  subnet_ids                = var.subnet_ids
  control_plane_subnet_ids  = var.control_plane_subnet_ids
  cluster_enabled_log_types = var.cluster_enabled_log_types

  # EKS Managed Node Group(s)
  eks_managed_node_groups = var.eks_managed_node_groups

  # Fargate Profile(s)
  fargate_profiles = var.fargate_profiles

  manage_aws_auth_configmap = true
  create_aws_auth_configmap = true
  aws_auth_users            = var.aws_auth_users

  create_kms_key = false
  cluster_encryption_config = {
    resources        = ["secrets"]
    provider_key_arn = module.kms.key_arn
  }
  tags = local.tags
}

module "kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = "1.1.0"

  aliases               = ["eks/${var.cluster_name}"]
  description           = "${var.cluster_name} cluster encryption key"
  enable_default_policy = true
  key_owners            = [data.aws_caller_identity.current.arn]

  tags = local.tags
}

resource "local_file" "kubeconfig" {
  sensitive_content = templatefile("${path.module}/kubeconfig.tpl", {
    cluster_name = var.cluster_name,
    clusterca    = module.eks.cluster_certificate_authority_data,
    endpoint     = module.eks.cluster_endpoint,
  })
  filename = "./kubeconfig-${var.cluster_name}"
}
