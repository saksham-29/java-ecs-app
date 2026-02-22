# Java ECS Application

Spring Boot application deployed on AWS ECS Fargate with Terraform infrastructure as code.

## Architecture

- **Application**: Spring Boot REST API
- **Container**: Docker (multi-stage build)
- **Orchestration**: AWS ECS Fargate
- **Load Balancer**: Application Load Balancer
- **Registry**: Amazon ECR
- **Networking**: VPC with public/private subnets, NAT Gateway
- **Monitoring**: CloudWatch alarms (CPU, task count) with SNS email alerts
- **CI/CD**: GitHub Actions with OIDC authentication

## Infrastructure

All infrastructure is managed with Terraform:

- VPC with multi-AZ setup
- ECS cluster and service
- ALB with health checks
- ECR repository
- IAM roles and policies
- CloudWatch monitoring
- SNS notifications

## Deployment

### Prerequisites

- AWS CLI configured
- Docker installed
- Terraform installed

### Deploy Infrastructure

```bash
cd infrastructure/terraform
terraform init
terraform plan
terraform apply
```

### Build and Push Docker Image

```bash
# Login to ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <account-id>.dkr.ecr.us-east-1.amazonaws.com

# Build and push
docker build -t java-ecs-app .
docker tag java-ecs-app:latest <account-id>.dkr.ecr.us-east-1.amazonaws.com/java-ecs-app:latest
docker push <account-id>.dkr.ecr.us-east-1.amazonaws.com/java-ecs-app:latest
```

### CI/CD

GitHub Actions automatically builds and deploys on push to `main` branch using SHA-tagged images.

Required GitHub Secret:
- `AWS_ROLE_ARN`: IAM role ARN for OIDC authentication

## Monitoring

- CPU utilization alarm (threshold: 80%)
- Task count alarm (threshold: < 1)
- Email notifications via SNS

## Cleanup

```bash
cd infrastructure/terraform
terraform destroy
```
