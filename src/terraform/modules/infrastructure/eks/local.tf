locals {
  tags = merge({
    Cluster = var.cluster_name
  }, var.tags)
}