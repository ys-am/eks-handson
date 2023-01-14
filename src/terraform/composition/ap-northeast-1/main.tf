locals {
  cidr_blocks = [for cidr_block in cidrsubnets("${var.cidr}", 8, 8, 8) : cidrsubnets(cidr_block, 4, 4, 4)]
}


module "network" {
  source = "../../modules/infrastructure/network"

  name = "eks-vpc"

  cidr            = var.cidr
  private_subnets = local.cidr_blocks[0]
  public_subnets  = local.cidr_blocks[1]
}

module "guardian" {
  source = "../../modules/infrastructure/eks"

  cluster_name    = "guardian"
  cluster_version = "1.23"

  cluster_endpoint_public_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }
  vpc_id                   = module.network.vpc_id
  subnet_ids               = module.network.private_subnets
  control_plane_subnet_ids = module.network.private_subnets
  eks_managed_node_groups = {
    blue = {
      min_size      = 1
      max_size      = 3
      desired_size  = 1
      instance_type = ["t3.medium"]
      capacity_type = "SPOT"
    }
  }
  aws_auth_users = [
    {
      userarn  = var.userarn
      username = var.username
      groups   = ["system:masters"]
    }
  ]
}