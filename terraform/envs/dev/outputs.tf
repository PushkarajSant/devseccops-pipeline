output "vpc_id" {
  description = "VPC ID"
  value       = module.network.vpc_id
}

output "ecr_repository_url" {
  description = "ECR repository URL - Push your Docker images here"
  value       = module.ecs.ecr_url
}
