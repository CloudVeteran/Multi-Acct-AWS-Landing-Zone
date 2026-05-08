output "organization_id" {
  value       = module.landing_zone.organization_id
  description = "AWS Organization ID"
}

output "account_ids" {
  value       = module.landing_zone.account_ids
  description = "Map of all created account names to their IDs"
}