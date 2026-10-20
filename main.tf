terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = var.common_tags
  }
}

provider "kubernetes" {
  host = aws_eks_cluster.main.endpoint
  token = data.aws_eks_cluster_auth.main.token
  cluster_ca_certificate = base64decode(aws_eks_cluster.main.certificate_authority[0].data)
}

provider "random" {}

data "aws_caller_identity" "current" {}
data "aws_eks_cluster" "main" {
  name = aws_eks_cluster.main.name
}
data "aws_eks_cluster_auth" "main" {
  name = aws_eks_cluster.main.name
}

locals {
  name = "${var.environment}-${var.app_name}"

  common_tags = merge(
    var.common_tags,
    {
      Project     = local.name
      Environment = var.environment
      ManagedBy   = "Terraform"
      Owner       = var.owner
    }
  )
}
