# Arquitetura do Sistema

## Abordagem Escolhida

Foi utilizada a Approach A

O projeto demonstra a utilização de serviços AWS, Infrastructure as Code, automação de deploy e comunicação assíncrona entre serviços

---

## Visão Geral da Arquitetura

A solução é composta por:

* Amazon VPC
* Amazon EC2
* Amazon RDS PostgreSQL
* Amazon SQS
* Dead Letter Queue

A infraestrutura é gerida através do Terraform e implementada automaticamente utilizando GitHub Actions

Comunicação híbrida:

- REST síncrono entre serviços
- Eventos assíncronos via SQS
---

## Design de Rede

A infraestrutura utiliza uma VPC com o bloco CIDR 10.0.0.0/16

Foram criadas:

* 2 subnets públicas
* 2 subnets privadas

As subnets públicas ligam a instância EC2

As subnets privadas ligam a base de dados PostgreSQL


A comunicação entre componentes é controlada através de Security Groups

---

## Comunicação Entre Serviços

O sistema é composto por 4 serviços principais:

- `api-gateway`
- `user-service`
- `product-service`
- `order-service`

### Síncrono (REST)

- api-gateway → user-service
- api-gateway → product-service
- api-gateway → order-service
- order-service → user-service (validação)
- order-service → product-service (validação)

### Assíncrono (SQS)

- order-service publica eventos de encomenda
- product-service consome eventos da fila
---


## Componentes Event-Driven

- Mensagens são publicadas pelo `order-service`
- Consumidas pelo `product-service`
- Falhas repetidas são movidas para a DLQ

- A DLQ permite análise de erros e reprocessamento manual.
---

## Principais Decisões Técnicas

Durante o desenvolvimento do projeto foram tomadas as seguintes decisões:

* Utilização de Terraform para Infrastructure as Code
* Utilização de GitHub Actions para CI/CD
* Utilização de OIDC em vez de Access Keys AWS
* Utilização de Amazon RDS PostgreSQL para persistência de dados
* Utilização de Amazon SQS para comunicação assíncrona
* Utilização de Docker para execução da aplicação
* Utilização de Ansible para configuração da EC2

