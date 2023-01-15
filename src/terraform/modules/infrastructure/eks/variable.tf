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

variable "cluster_enabled_log_types" {
  type = list(any)
  default = [
    "audit",
    "api",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]
}

variable "aws_auth_users" {
  type        = list(any)
  description = "List of user maps to add to the aws-auth configmap"
  default     = []
}

variable "tags" {
  type        = map(any)
  description = "tag"
  default     = {}
}

variable "region" {
  type        = string
  description = "AWS Region"
  default     = "ap-northeast-1"
}
