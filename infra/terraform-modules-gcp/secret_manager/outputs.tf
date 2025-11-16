output "secrets" {
  description = "Full resource names of the created secrets, keyed by the provided map keys"
  value = { for key, secret in google_secret_manager_secret.secret : key => {
    name    = secret.secret_id
    version = google_secret_manager_secret_version.secret_version[key].name
    }
  }
}

output "secret_versions" {
  description = "Full resource names of the created secret versions, keyed by the provided map keys"
  value       = { for key, version in google_secret_manager_secret_version.secret_version : key => version.name }
}
