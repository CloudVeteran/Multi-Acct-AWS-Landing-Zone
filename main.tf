provider "aws" {
  region = var.aws_region
}

module "landing_zone" {
  source = "./modules/landing-zone"

  organization_name = var.organization_name
  email_domain      = var.email_domain
  tags              = var.tags

  scp_policies = {
    deny_root = {
      policy_id = aws_organizations_policy.deny_root.id
    }
    deny_public_s3 = {
      policy_id = aws_organizations_policy.deny_public_s3.id
    }
  }
}

# ==========================================
# Service Control Policies
# ==========================================
resource "aws_organizations_policy" "deny_root" {
  name        = "DenyRootAccess"
  description = "Deny all actions performed as the root user"
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("${path.module}/policies/deny-root.json")
}

resource "aws_organizations_policy" "deny_public_s3" {
  name        = "DenyPublicS3Buckets"
  description = "Prevent creation of public S3 buckets"
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("${path.module}/policies/deny-public-s3.json")
}

# ==========================================
# GuardDuty (in Security Account)
# ==========================================
resource "aws_guardduty_detector" "security" {
  enable                       = true
  finding_publishing_frequency = "FIFTEEN_MINUTES"
  tags                         = var.tags
}

# ==========================================
# Security Hub
# ==========================================
resource "aws_securityhub_account" "main" {}

resource "aws_securityhub_standards_subscription" "nist_800_53" {
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
  depends_on    = [aws_securityhub_account.main]
}