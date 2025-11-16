# output "service_account_names" {
#   description = "The emails of the created service accounts"
#   value       = module.service_account.service_account_names
# }

output "secrets" {
  description = "Full resource names of the created secrets, keyed by the provided map keys"
  value       = module.secret_manager.secrets
}

output "secret_versions" {
  description = "Full resource names of the created secret versions, keyed by the provided map keys"
  value       = module.secret_manager.secret_versions
}