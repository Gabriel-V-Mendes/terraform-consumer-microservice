terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Consumo do modulo publicado no repositorio da plataforma, fixado por tag Git.
# Nenhum arquivo do modulo e copiado para este repositorio: o `terraform init`
# baixa o codigo direto do GitHub na versao v1.0.0.
module "microservice_infra" {
  source = "git::https://github.com/Gabriel-V-Mendes/platform-engineering.git//terraform/modules/microservice-infra?ref=v1.0.0"

  service_name         = var.service_name
  environment          = var.environment
  owner                = var.owner
  enable_s3_bucket     = var.enable_s3_bucket
  kubernetes_namespace = var.kubernetes_namespace
}
