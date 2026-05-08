# Multi-Account AWS Landing Zone

**Terraform • AWS Organizations • NIST 800-53 • FedRAMP Ready**

This project creates a production-grade multi-account AWS Landing Zone using Terraform.

## Features
- 6 seperate AWS accounts (Security, Logging, Prod, Non-Prod, Shared Services, Audit)
- AWS Control Tower or manual Landing Zone
- Service Control Policies (SCPs) for least privilege
- Centralized logging + Security Hub aggregation
- GuardDuty + Inspector enabled across all accounts
- AWS Config rules with automated remediation
- NIST 800-53 aligned

                    ┌──────────────────────────────┐
                    │     AWS Organization         │
                    │   (Root + SCPs attached)     │
                    └──────────────┬───────────────┘
                                   │
          ┌────────────────────────┼────────────────────────┐
          ▼                        ▼                        ▼
   ┌──────────────┐        ┌──────────────┐        ┌──────────────┐
   │  Security    │        │   Logging    │        │  Shared      │
   │   Account    │        │   Account    │        │  Services    │
   │              │        │              │        │   Account    │
   │ • GuardDuty  │        │ • S3 Logs    │        │              │
   │ • Security   │        │ • CloudTrail │        │              │
   │   Hub        │        │              │        │              │
   └──────────────┘        └──────────────┘        └──────────────┘

          ┌────────────────────────┼────────────────────────┐
          ▼                        ▼                        ▼
   ┌──────────────┐        ┌──────────────┐        ┌──────────────┐
   │  Production  │        │ Non-Production│        │    Audit     │
   │   Account    │        │   Account    │        │   Account    │
   └──────────────┘        └──────────────┘        └──────────────┘

## How to Deploy
```bash
terraform init
terraform plan
terraform apply
