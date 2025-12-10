# Infrastructure as Code

Production-ready Terraform modules and examples for AWS, Azure, and GCP cloud infrastructure.

## Overview

This repository contains reusable Terraform modules, examples, and best practices for managing cloud infrastructure as code.

## Features

- ✅ Multi-cloud support (AWS, Azure, GCP)
- ✅ Production-ready modules
- ✅ Security best practices
- ✅ Cost optimization
- ✅ Comprehensive documentation
- ✅ Testing examples

## Cloud Providers

### AWS
- EKS clusters
- VPC networking
- RDS databases
- S3 buckets
- IAM roles and policies
- Lambda functions

### Azure
- AKS clusters
- Virtual networks
- SQL databases
- Storage accounts
- Managed identities

### GCP
- GKE clusters
- VPC networks
- Cloud SQL
- Cloud Storage
- Service accounts

## Structure

```
infrastructure-as-code/
├── modules/           # Reusable Terraform modules
│   ├── aws/
│   ├── azure/
│   └── gcp/
├── examples/          # Usage examples
├── environments/     # Environment-specific configurations
│   ├── dev/
│   ├── staging/
│   └── production/
└── tests/            # Terratest examples
```

## Quick Start

### AWS Example

```hcl
module "eks_cluster" {
  source = "./modules/aws/eks"
  
  cluster_name = "production"
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.private_subnet_ids
}
```

### Azure Example

```hcl
module "aks_cluster" {
  source = "./modules/azure/aks"
  
  cluster_name = "production"
  resource_group_name = "rg-production"
}
```

## Best Practices

- ✅ Use remote state (S3, Azure Storage, GCS)
- ✅ Implement state locking
- ✅ Use workspaces for environments
- ✅ Tag all resources
- ✅ Enable versioning on state backends
- ✅ Use modules for reusability
- ✅ Validate and format code
- ✅ Document all variables and outputs

## Testing

This repository includes Terratest examples for automated infrastructure testing.

```bash
cd tests
go test -v -timeout 30m
```

## Security

- ✅ Least privilege IAM policies
- ✅ Encryption at rest and in transit
- ✅ Network security groups
- ✅ Secrets management integration
- ✅ Compliance scanning (Checkov, Tfsec)

## License

MIT License

