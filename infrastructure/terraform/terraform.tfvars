aws_region   = "us-east-1"
project_name = "java-ecs-app"
environment  = "dev"

vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"
availability_zone   = "us-east-1a"

alb_ingress_cidr  = "0.0.0.0/0"
alb_listener_port = 80

log_retention_days = 14
image_tag          = "e4ac714d0c8bd04e39d94ccaaf0f070d329da335"


container_port = 8080
task_cpu       = 512
task_memory    = 1024
desired_count  = 1

alert_email = "sakshamsaxena16@gmail.com"

