output "cluster_endpoint" {
  description = "Endpoint for your Kubernetes API server"
  value       = try(module.eks.cluster_endpoint, null)
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = try(module.eks.cluster_certificate_authority_data, null)
}

output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = try(module.eks.cluster_name, null)
}
