terraform {
  required_version = ">= 1.0"
  
  backend "s3" {
    bucket = "terraform-state-bucket"
    key    = "eks-cluster/terraform.tfstate"
    region = "us-east-1"
  }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# VPC Module
module "vpc" {
  source = "../../modules/aws/vpc"
  
  vpc_name             = "eks-vpc"
  vpc_cidr             = "10.0.0.0/16"
  availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
  enable_nat_gateway   = true
  
  tags = {
    Environment = "production"
    ManagedBy   = "Terraform"
  }
}

# EKS Cluster Module
module "eks" {
  source = "../../modules/aws/eks"
  
  cluster_name    = "production-cluster"
  subnet_ids      = module.vpc.private_subnet_ids
  public_endpoint = false
  
  node_group_desired_size = 3
  node_group_max_size     = 10
  node_group_min_size     = 1
  instance_types          = ["t3.medium"]
  
  tags = {
    Environment = "production"
    ManagedBy   = "Terraform"
  }
}

