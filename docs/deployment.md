# Processo de Deploy

---
# Pré-requisitos
Antes da implementação é necessário possuir:

- AWS CLI configurado
- Terraform instalado
- Docker instalado
- Ansible instalado
- Acesso SSH à EC2
- Docker Hub credenciais

## Visão Geral

O deploy é totalmente automatizado através de uma pipeline CI/CD no GitHub Actions.

O objetivo é garantir infraestrutura, build e execução consistentes.

---

## Fluxo de Deploy

Após execução da pipeline:

- Terraform cria ou atualiza a infraestrutura AWS
- Docker constrói imagens das aplicações
- Imagens são enviadas para o Docker Hub
- Ansible conecta na EC2
- Containers são atualizados e iniciados

### Fluxo simplificado

```text
Terraform → Docker Build → Docker Push → Ansible Deploy