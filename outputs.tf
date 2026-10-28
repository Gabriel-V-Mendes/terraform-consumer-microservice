output "ecr_repository_url" {
  description = "URL do repositorio ECR criado pelo modulo"
  value       = module.microservice_infra.ecr_repository_url
}

output "iam_role_arn" {
  description = "ARN da role IRSA criada pelo modulo"
  value       = module.microservice_infra.iam_role_arn
}
