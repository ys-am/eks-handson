variable "cluster_name" {
  type        = string
  description = "cluster name"
  default     = ""
}

variable "cluster_addons" {
  type        = map(any)
  description = "Cluster Addon"
  default     = {}
}

variable "cluster_version" {
  type        = string
  description = "cluster version"
  default     = "1.23"
}

variable "cluster_endpoint_public_access" {
  type        = bool
  description = "Cluster Endpoint public Access"
  default     = false
}

variable "eks_managed_node_group_defaults" {
  type        = map(any)
  description = "ManagedNodeGroup Default InstanceType"
  default     = { instance_types = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"] }
}

variable "eks_managed_node_groups" {
  type        = map(any)
  description = "EKS ManagedNodeGroups"
  default     = {}
}

variable "fargate_profiles" {
  type        = map(any)
  description = "Fargate Profile"
  default     = {}
}

variable "vpc_id" {
  type        = string
  description = "VPCID"
  default     = ""
}

variable "subnet_ids" {
  type        = list(any)
  description = "	A list of subnet IDs where the nodes/node groups will be provisioned. If control_plane_subnet_ids is not provided, the EKS cluster control plane (ENIs) will be provisioned in these subnets"
  default     = []
}

variable "control_plane_subnet_ids" {
  type        = list(any)
  description = "A list of subnet IDs where the EKS cluster control plane (ENIs) will be provisioned. Used for expanding the pool of subnets used by nodes/node groups without replacing the EKS control plane	"
  default     = []
}

