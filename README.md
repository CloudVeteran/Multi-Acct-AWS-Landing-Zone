# Multi-Account AWS Landing Zone

**Terraform • AWS Organizations • NIST 800-53 • FedRAMP Ready**

This project creates a production-grade multi-account AWS Landing Zone using Terraform.

## Features
- 6 AWS accounts (Security, Logging, Prod, Non-Prod, Shared Services, Audit)
- Service Control Policies (SCPs)
- GuardDuty + Security Hub enabled
- Centralized logging
- NIST 800-53 aligned

## How to Deploy
```bash
terraform init
terraform plan
terraform apply

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
