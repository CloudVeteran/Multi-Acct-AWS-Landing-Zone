variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "organization_name" {
  description = "Short name for your organization (used in account names)"
  type        = string
  default     = "acme-corp"
}

variable "email_domain" {
  description = "Email domain for creating AWS accounts"
  type        = string
  default     = "acme-corp.com"
}

variable "tags" {
  description = "Default tags applied to all resources"
  type        = map(string)
  default = {
    Project     = "Landing-Zone"
    Environment = "Management"
    Owner       = "Marlon"
    Compliance  = "NIST-800-53"
    ManagedBy   = "Terraform"
  }
}