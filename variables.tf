variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "myapp"
}

variable "owner" {
  description = "Owner contact"
  type        = string
  default     = "devops@company.com"
}

variable "common_tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default = {
    Department = "Platform"
    ManagedBy  = "Terraform"
  }
}

# EKS Core
variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "myapp-eks"
}

variable "cluster_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.29"
}

# Node Groups
variable "node_group_name" {
  description = "Name of the managed node group"
  type        = string
  default     = "default-node-group"
}

variable "node_group_desired_size" {
  description = "Desired number of nodes"
  type        = number
  default     = 2
}

variable "node_group_min_size" {
  description = "Minimum number of nodes"
  type        = number
  default     = 1
}

variable "node_group_max_size" {
  description = "Maximum number of nodes"
  type        = number
  default     = 4
}

variable "node_instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
  default     = "t3.medium"
}

variable "node_instance_ami" {
  description = "AMI ID for worker nodes (EKS recommended AMI)"
  type        = string
  default     = ""
}

# IAM
variable "iam_role_name" {
  description = "IAM role name for the cluster"
  type        = string
  default     = "eks-cluster-role"
}
