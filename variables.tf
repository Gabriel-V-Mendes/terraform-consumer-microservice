variable "aws_region" {
  type        = string
  description = "Regiao AWS"
  default     = "us-east-1"
}

variable "service_name" {
  type        = string
  description = "Nome do microsservico"
  default     = "pagamentos-api"
}

variable "environment" {
  type        = string
  description = "Ambiente (development, staging, production)"
  default     = "development"
}

variable "owner" {
  type        = string
  description = "Time responsavel"
  default     = "team-checkout"
}

variable "enable_s3_bucket" {
  type        = bool
  description = "Provisiona bucket S3 dedicado"
  default     = false
}

variable "kubernetes_namespace" {
  type        = string
  description = "Namespace do ServiceAccount (IRSA)"
  default     = "pagamentos"
}
