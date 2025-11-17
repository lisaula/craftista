resource "google_sql_database_instance" "main" {
  name                = var.instance_name
  database_version    = var.database_version
  region              = var.region
  deletion_protection = var.deletion_protection

  settings {
    tier    = var.tier
    edition = var.edition
  }
}

resource "google_sql_database" "database" {
  name            = var.database_name
  instance        = google_sql_database_instance.main.name
  deletion_policy = var.deletion_policy
}

data "google_project" "project" {}

data "google_secret_manager_secret_version" "db_user" {
  project = data.google_project.project.project_id
  secret  = var.db_username
}

data "google_secret_manager_secret_version" "db_pass" {
  project = data.google_project.project.project_id
  secret  = var.db_password
}

resource "google_sql_user" "users" {

  name     = data.google_secret_manager_secret_version.db_user.secret_data
  instance = google_sql_database_instance.main.name
  password = data.google_secret_manager_secret_version.db_pass.secret_data

}