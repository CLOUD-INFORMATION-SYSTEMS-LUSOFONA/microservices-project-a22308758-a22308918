output "ec2_public_ip" {
  value       = aws_instance.sanity_ec2.public_ip
  description = "IP Publico da EC2"
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "ID da VPC"
}

output "rds_endpoint" {
  value       = aws_db_instance.postgres.endpoint
  description = "Endpoint da Base de Dados RDS"
}

output "queue_url" {
  value = aws_sqs_queue.main.id
}

output "dlq_url" {
  value = aws_sqs_queue.dlq.id
}