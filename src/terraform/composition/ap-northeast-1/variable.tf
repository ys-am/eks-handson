variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "AWS_ACCESS_KEY_ID" {
  type      = string
  sensitive = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  type      = string
  sensitive = true
}

variable "userarn" {
  type    = string
  default = "arn:aws:iam::66666666666:user/user1"
}

variable "username" {
  type    = string
  default = "user1"
}