terraform {
  backend "gcs" {
    bucket = "tf-state-dev-craftista-isaula"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}
