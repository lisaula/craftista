output "service_account_names" {
  value = { for sa_key, sa in google_service_account.sa : sa_key => sa.name }
}