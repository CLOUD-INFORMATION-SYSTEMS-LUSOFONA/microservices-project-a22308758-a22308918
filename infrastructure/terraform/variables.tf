variable "aws_region" {
  description = "AWS Region for resource deployment"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name for resource naming and tagging"
  type        = string
  default     = "microservices-project"
}

variable "environment" {
  description = "Environment (dev, prod, etc)"
  type        = string
  default     = "dev"
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {
    Project     = "microservices-project"
    Environment = "dev"
    Owner       = "grupo-a2230878"
    ManagedBy   = "terraform"
  }
}
