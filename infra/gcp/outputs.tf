output "service_account_names" {
  description = "The emails of the created service accounts"
  value       = module.service_account.service_account_names
}