sa = {
  sa-craftista = {
    display_name = "Cloud Run Service Account for Craftista services"
    project_id   = "sodium-sublime-379101"
    google_roles = [
      "roles/logging.viewer",
      "roles/artifactregistry.writer",
      "roles/run.admin",
      "roles/editor",
      "roles/logging.logWriter",
      "roles/iam.serviceAccountUser",
      "roles/storage.admin",
      "roles/secretmanager.viewer",
    ]
  }
}