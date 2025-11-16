data "google_secret_manager_secret_version" "this" {
  for_each = var.secrets
  project  = var.project_id
  secret   = each.key
}

data "google_project" "project" {}

# Auto-generated Cloud Build v2 service account
locals {
  cloudbuild_sa = "service-${data.google_project.project.number}@gcp-sa-cloudbuild.iam.gserviceaccount.com"
}

resource "google_secret_manager_secret_iam_binding" "github_token_access" {
  for_each  = var.secrets
  project   = var.project_id
  secret_id = each.key

  role = "roles/secretmanager.secretAccessor"

  members = [
    "serviceAccount:${local.cloudbuild_sa}"
  ]
}

resource "google_cloudbuildv2_connection" "connection" {
  location = var.location
  name     = var.connection_name
  project  = var.project_id
  github_config {
    app_installation_id = data.google_secret_manager_secret_version.this[var.app_installation_id].secret_data
    authorizer_credential {
      oauth_token_secret_version = lookup(var.secrets, var.oauth_token_secret_version, null)
    }
  }

  depends_on = [google_secret_manager_secret_iam_binding.github_token_access]
}

resource "google_cloudbuildv2_repository" "repo" {
  name              = var.repository_name
  parent_connection = google_cloudbuildv2_connection.connection.id
  remote_uri        = var.repo_remote_uri
}

resource "google_cloudbuild_trigger" "trigger" {
  location        = var.location
  service_account = var.service_accounts[var.service_account]
  repository_event_config {
    repository = google_cloudbuildv2_repository.repo.id
    push {
      branch = "^main$"
    }
  }

  filename = var.trigger_cloudbuild_filename
}
