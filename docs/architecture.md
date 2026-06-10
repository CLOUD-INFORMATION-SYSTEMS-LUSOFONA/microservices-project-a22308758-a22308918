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

O sistema é composto por dois serviços:

* Service A
* Service B

O Service A produz mensagens

As mensagens são enviadas para uma fila Amazon SQS

O Service B consome as mensagens da fila e processa a informação recebida

Esta abordagem reduz o acoplamento entre componentes e melhora a escalabilidade da solução

---


## Componentes Event-Driven

A comunicação assíncrona é realizada através do Amazon SQS

Quando uma mensagem falha repetidamente o processamento, é enviada para uma Dead Letter Queue

Esta abordagem aumenta a resiliência da aplicação e facilita a identificação de erros

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

