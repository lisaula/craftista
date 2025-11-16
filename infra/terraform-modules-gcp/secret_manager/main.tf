locals {
  secrets = {
    for key, value in var.secrets : key => {
      secret_id   = coalesce(try(value.secret_id, null), key)
      labels      = try(value.labels, null)
      secret_data = value.secret_data
    }
  }
}

resource "google_secret_manager_secret" "secret" {
  for_each = local.secrets

  project   = var.project_id
  secret_id = each.value.secret_id
  labels    = each.value.labels

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "secret_version" {
  for_each = local.secrets

  secret      = google_secret_manager_secret.secret[each.key].name
  secret_data = each.value.secret_data
}
