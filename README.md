# Terraform Consumer Microservice

[![Terraform Remote Module Validate](https://github.com/Gabriel-V-Mendes/terraform-consumer-microservice/actions/workflows/ci.yml/badge.svg)](https://github.com/Gabriel-V-Mendes/terraform-consumer-microservice/actions/workflows/ci.yml)

Este repositório existe para **comprovar o consumo externo e desacoplado** do módulo de infraestrutura da plataforma [platform-engineering](https://github.com/Gabriel-V-Mendes/platform-engineering) versionado por tag semântica Git (`?ref=v1.0.0`).

## 1. Origem Remota do Módulo

O arquivo [`main.tf`](main.tf) referencia diretamente o repositório central:

```hcl
module "microservice_infra" {
  source = "git::https://github.com/Gabriel-V-Mendes/platform-engineering.git//terraform/modules/microservice-infra?ref=v1.0.0"

  service_name         = var.service_name
  environment          = var.environment
  owner                = var.owner
  enable_s3_bucket     = var.enable_s3_bucket
  kubernetes_namespace = var.kubernetes_namespace
}
```

Nenhum arquivo do módulo é copiado ou duplicado localmente. O Terraform baixa o módulo via Git e bloqueia a versão com base na tag `v1.0.0`.

## 2. Validação Local

```bash
terraform init -backend=false
terraform fmt -check -recursive
terraform validate
```

Resultado da validação:
```text
Success! The configuration is valid.
```

## 3. Validação Automatizada em CI

A pipeline do GitHub Actions em [`.github/workflows/ci.yml`](.github/workflows/ci.yml) executa em cada push e pull request:
1. `terraform init` baixando o módulo remoto.
2. Checagem em `.terraform/modules/modules.json` para assegurar a referência `?ref=v1.0.0`.
3. `terraform fmt -check`.
4. `terraform validate`.
