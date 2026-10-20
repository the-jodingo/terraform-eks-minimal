output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.main.name
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_certAuthority" {
  description = "Base64 encoded certificate authority data"
  value       = aws_eks_cluster.main.certificate_authority[0].data
}

output "cluster_arn" {
  description = "EKS cluster ARN"
  value       = aws_eks_cluster.main.arn
}

output "node_group_name" {
  description = "Managed node group name"
  value       = aws_eks_node_group.main.name
}

output "node_group_arn" {
  description = "Node group ARN"
  value       = aws_eks_node_group.main.arn
}

output "iam_role_arn" {
  description = "EKS cluster IAM role ARN"
  value       = aws_iam_role.cluster.arn
}
