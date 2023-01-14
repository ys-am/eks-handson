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
  aws_auth_users            = var.aws_auth_users

}