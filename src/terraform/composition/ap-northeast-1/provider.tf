terraform {
  cloud {
    organization = "ysam"
    workspaces {
      name = "eks-handson"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.50.0"
    }
  }
}

provider "aws" {
  region     = "ap-northeast-1"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

provider "kubernetes" {
  host                   = module.guardian.cluster_endpoint
  cluster_ca_certificate = base64decode(module.guardian.cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    #This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", module.guardian.cluster_name]
  }
}
