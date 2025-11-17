terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.11.0"
    }
  }

  required_version = "~> 1.13.5"
}
