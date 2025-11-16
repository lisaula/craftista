variable "location" {
  description = "Location where resources are being created (e.g. us-central1)"
  type        = string
  default     = "northamerica-south1"
}

variable "service_account" {
  description = "Service account to run the CloudBuild trigger"
  type        = string
  default     = ""
}

variable "connection_name" {
  description = "Cloudbuild connection name"
  type        = string
}

variable "app_installation_id" {
  description = "GitHub App installation ID"
  type        = string
}

variable "oauth_token_secret_version" {
  description = "Secret Manager secret version for OAuth token"
  type        = string
}

variable "repository_name" {
  description = "Name of the CloudBuild repository"
  type        = string
}

variable "repo_remote_uri" {
  description = "GitHub/Gitlab Remote URI of the repository"
  type        = string
}

variable "trigger_cloudbuild_filename" {
  description = "Filename of the CloudBuild trigger configuration (e.g. cloudbuild.yaml) "
  type        = string
  default     = "cloudbuild.yaml"
}

variable "service_accounts" {
  description = "Map of service account emails created"
  type        = map(string)
}