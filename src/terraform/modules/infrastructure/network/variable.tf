variable "name" {
  type        = string
  description = "Name to be used on all the resources as identifier"
  default     = "my-vpc"
}

variable "cidr" {
  type        = string
  description = "The CIDR block of the VPC"
  default     = "10.0.0.0/8"
}

variable "private_subnets" {
  type        = list(any)
  default     = []
  description = "PrivateSubnet"
}

variable "public_subnets" {
  type        = list(any)
  default     = []
  description = "Public Subnet"
}

variable "intra_subnets" {
  type        = list(any)
  default     = []
  description = "Intra Subnet"
}

variable "azs" {
  type    = list(any)
  default = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
}

variable "enable_nat_gateway" {
  type        = bool
  default     = true
  description = "Create NatGateway"
}

variable "single_nat_gateway" {
  type        = bool
  default     = true
  description = "Single Nat GatewayResource"
}

variable "one_nat_gateway_per_az" {
  type        = bool
  default     = false
  description = ""
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Tags"
}