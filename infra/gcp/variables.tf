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

variable "secrets" {
  description = "Map of secrets to create along with their payloads"
  type = map(object({
    secret_id   = optional(string)
    labels      = optional(map(string), {})
    secret_data = string
  }))
  default = {}
}

variable "github_app_installation_id" {
  description = "Map key for GitHub App Installation ID secret"
  type        = string
}

variable "github_oauth_token" {
  description = "Map key for GitHub OAuth token secret"
  type        = string
}