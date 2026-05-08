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

### Diagram Flowchart
    subgraph AWS_Organization["AWS Organization"]
        direction TB
        Root["Root + Service Control Policies<br/>(Deny Root + Deny Public S3)"]
    end

    subgraph Security_Account["Security Account"]
        GuardDuty["Amazon GuardDuty"]
        SecurityHub["AWS Security Hub<br/>(NIST 800-53 Standard)"]
    end

    subgraph Logging_Account["Logging Account"]
        S3["Centralized S3 Logging Bucket"]
        CloudTrail["Organization CloudTrail"]
    end

    subgraph Workload_Accounts["Workload Accounts"]
        Prod["Production Account"]
        NonProd["Non-Production Account"]
        Shared["Shared Services Account"]
        Audit["Audit Account"]
    end

    Root -->|SCP Enforcement| Security_Account
    Root -->|SCP Enforcement| Logging_Account
    Root -->|SCP Enforcement| Workload_Accounts

    Security_Account -->|Findings & Alerts| Logging_Account
    GuardDuty -.-> SecurityHub

    Logging_Account -.->|Centralized Logs| Security_Account

    style Root fill:#FF9900,stroke:#232F3E,color:#fff
    style Security_Account fill:#232F3E,stroke:#FF9900,color:#fff
    style Logging_Account fill:#232F3E,stroke:#FF9900,color:#fff
    style Workload_Accounts fill:#1B660F,stroke:#fff,color:#fff
    style GuardDuty fill:#FF9900,stroke:#232F3E
    style SecurityHub fill:#FF9900,stroke:#232F3E
    
#### How to Deploy
```bash
terraform init
terraform plan
terraform apply