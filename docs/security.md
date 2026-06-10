# Modelo de Segurança

## Gestão de Identidade e Acesso

O acesso à AWS é realizado através de IAM Roles.

- O GitHub Actions autentica via OpenID Connect (OIDC), eliminando a necessidade de chaves AWS permanentes.

---

## Gestão de Segredos

São utilizados GitHub Secrets para armazenar:

- AWS_ROLE_TO_ASSUME
- DOCKERHUB_TOKEN
- DOCKERHUB_USERNAME
- SSH_PRIVATE_KEY

Dados sensíveis de runtime são injetados durante o pipeline CI/CD.

## Segurança de Rede

### VPC

A infraestrutura está isolada numa VPC dedicada, com separação entre sub-redes públicas e privadas.

- Subnets públicas: gateway de aplicação
- Subnets privadas: base de dados e serviços internos

---



### Security Group - Base de Dados

Acesso restrito:

- PostgreSQL (5432): apenas a partir do security group da aplicação

A base de dados não possui exposição pública.

---

## Proteção da Base de Dados

A instância PostgreSQL está configurada em subnets privadas:

- Sem IP público
- Acesso apenas interno dentro da VPC
- Protegida por Security Groups

---

## Proteção do Estado Terraform

O estado remoto do Terraform é armazenado em S3.

O bloqueio de estado é garantido via DynamoDB.

Isto assegura:

- Consistência do estado
- Evita concorrência em alterações
- Suporte a pipelines CI/CD


