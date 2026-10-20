# Terraform EKS Minimal Cluster

Minimal, production-ready Amazon EKS Kubernetes cluster using Terraform.

Provisions a fully functional EKS cluster with managed node group, IAM OIDC provider, and basic cluster access.

## Architecture

```
┌─────────────┐
│  Kubernetes │
│  Cluster    │
│  (EKS)      │
└──────┬──────┘
       │
       ▼
┌─────────────────────────┐
│  Managed Node Group     │
│  (t3.medium × N nodes)  │
└─────────────────────────┘
```

### Resources Provisioned

| Resource | Purpose |
|----------|---------|
| EKS Cluster | Kubernetes control plane |
| IAM Role | Cluster service role |
| IAM OIDC Provider | Enable IAM roles for service accounts |
| Managed Node Group | Worker nodes (t3.medium × N) |
| VPC CNI | Networking for pods |

## Quick Start

```bash
# Configure
cp terraform.tfvars.example terraform.tfvars

# Initialize
terraform init

# Plan
terraform plan

# Apply
terraform apply
```

## Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `aws_region` | `us-west-2` | AWS region |
| `environment` | `dev` | Environment |
| `cluster_name` | `myapp-eks` | Cluster name |
| `cluster_version` | `1.29` | Kubernetes version |
| `node_group_name` | `default-node-group` | Node group name |
| `node_instance_type` | `t3.medium` | Node instance type |

## Outputs

| Output | Description |
|--------|-------------|
| `cluster_name` | Cluster name |
| `cluster_endpoint` | Cluster endpoint |
| `cluster_certAuthority` | CA data (base64) |
| `cluster_arn` | Cluster ARN |
| `node_group_name` | Node group name |
| `node_group_arn` | Node group ARN |
| `iam_role_arn` | Cluster IAM role ARN |

## Configuration

```bash
# Get kubeconfig
aws eks --region us-west-2 update-kubeconfig --name myapp-eks

# Verify
kubectl get nodes
kubectl get svc
```

## Cleanup

```bash
terraform destroy
```

## License

MIT
