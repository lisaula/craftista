resource "google_cloudbuildv2_connection" "connection" {
  location = var.location
  name     = var.connection_name
  project  = var.project_id
  github_config {
    app_installation_id = var.app_installation_id
    authorizer_credential {
      oauth_token_secret_version = var.oauth_token_secret_version
    }
  }
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
