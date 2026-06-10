# Setup do Projeto

## Requisitos

Antes de iniciar, garantir a instalação de:

- AWS CLI configurado
- Terraform instalado
- Docker instalado
- Ansible instalado
- Git instalado
- Conta Docker Hub ativa

---

## Configuração Inicial

### 1. Clonar o repositório

```bash
git clone <https://github.com/CLOUD-INFORMATION-SYSTEMS-LUSOFONA/microservices-project-a22308758-a22308918>
cd microservices-project
```

### 2. Inicializar o Terraform

```bash
cd infrastructure/terraform
terraform init
```

### 3. Validar a configuração

```bash
terraform validate
```

### 4. Plano de execução

```bash
terraform plan
```

### 5. Criar infraestrutura

```bash
terraform apply
```

---

## Fluxo de Deploy
O pipeline executa automaticamente em:

- Push para a branch `main`
- Execução manual via GitHub Actions

---

## Deploy Manual (opcional)

### Terraform

```bash
cd infrastructure/terraform
terraform apply
```

### Docker

```bash
cd services
docker compose build
docker compose push
```

### Ansible

```bash
cd ansible/playbooks
ansible-playbook deploy.yml
```