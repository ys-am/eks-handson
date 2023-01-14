locals {
  cidr_blocks = [for cidr_block in cidrsubnets("${var.cidr}", 8, 8, 8) : cidrsubnets(cidr_block, 4, 4, 4)]
}

#tfsec:ignore:aws-ec2-no-public-ip-subnet
#tfsec:ignore:aws-ec2-require-vpc-flow-logs-for-all-vpcs
module "network" {
  source = "../../modules/infrastructure/network"

  name = "eks-vpc"

  cidr            = var.cidr
  private_subnets = local.cidr_blocks[0]
  public_subnets  = local.cidr_blocks[1]
}