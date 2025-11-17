variable "GITHUB_OAUTH_TOKEN" {
  description = "GitHub OAuth token for accessing private repositories"
  type        = string
  sensitive   = true
}

variable "GITHUB_APP_INSTALLATION_ID" {
  description = "GitHub App Installation ID of the Google Cloud App (found in Github account developer settings)"
  type        = string
  sensitive   = true
}

variable "CATALOGUE_DB_USERNAME_ID" {
  description = "Catalogue database username for Cloud SQL"
  type        = string
  sensitive   = true
}

variable "CATALOGUE_DB_PASSWORD_ID" {
  description = "Catalogue database password for Cloud SQL"
  type        = string
  sensitive   = true
}