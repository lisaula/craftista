variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region (e.g., us-central1)"
  type        = string
}

variable "location" {
  description = "Location for Cloud Build resources"
  type        = string
  default     = "global"
}

variable "service_account" {
  description = "Service account email for Cloud Build"
  type        = string
}

variable "cloudbuild_connection_name" {
  description = "Name of the Cloud Build connection"
  type        = string
}

variable "github_app_installation_id" {
  description = "GitHub App installation ID for Cloud Build connection"
  type        = string
}

variable "github_oauth_token_secret_version" {
  description = "Secret version for GitHub OAuth token"
  type        = string
}

variable "cloudbuild_repository_name" {
  description = "Name of the Cloud Build repository"
  type        = string
}

variable "cloudbuild_repo_remote_uri" {
  description = "Remote URI of the Cloud Build repository"
  type        = string
}

variable "cloudbuild_trigger_filename" {
  description = "Filename of the Cloud Build trigger configuration"
  type        = string
}


variable "cloudRun" {
  type = map(any)
}

variable "sa" {
  description = "Service account names for Cloud Build"
  type        = map(any)
}