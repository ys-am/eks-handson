locals {
  cidr_blocks = [for cidr_block in cidrsubnets("${var.cidr}", 8, 8, 8) : cidrsubnets(cidr_block, 4, 4, 4)]
}
