variable "aws_region" {}
variable "project_name" {}

# Networking
variable "vpc_cidr" {}
variable "public_subnet_cidr" {}
variable "private_subnet_cidr" {}
variable "availability_zone" {}

# ALB
variable "alb_ingress_cidr" {}
variable "alb_listener_port" {}

# ECS
variable "log_retention_days" {}

# Tags
variable "environment" {}

variable "container_port" {}
variable "task_cpu" {}
variable "task_memory" {}
variable "desired_count" {}
variable "image_tag" {}