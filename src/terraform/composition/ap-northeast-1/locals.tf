locals {
  cidr_blocks = [for cidr_block in cidrsubnets("${var.cidr}", 4, 4, 4) : cidrsubnets(cidr_block, 4, 4, 4)]
}
