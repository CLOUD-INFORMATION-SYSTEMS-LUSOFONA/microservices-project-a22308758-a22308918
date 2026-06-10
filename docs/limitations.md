# Limitações

## Infraestrutura

* Uma única instância EC2 executa todos os serviços (sem escalabilidade horizontal)
* Sem auto-scaling ou load balancing 
## Performance

* Limitado pelo tamanho da instância (t3.micro)
* Serviços Java com elevado consumo de memória
* Containers operam próximos dos limites de memória sob carga

## Base de Dados

* Base de dados partilhada entre serviços 
* Não totalmente desacoplada

## Observabilidade

* Sem logging centralizado 
* Sem monitorização (Prometheus/Grafana)
* Debug depende de logs do Docker

## Melhorias Futuras

* Migrar para ECS ou Kubernetes 
* Adicionar API Gateway (AWS nativo)
* Separar bases de dados por serviço
