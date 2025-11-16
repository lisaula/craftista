module "secret_manager" {
  source = "../terraform-modules-gcp/secret_manager"

  secrets = {
    "GITHUB_OAUTH_TOKEN" = {
      labels = {
        environment = "prod"
      }
      secret_data = var.GITHUB_OAUTH_TOKEN
    }
    "GITHUB_APP_INSTALLATION_ID" = {
      labels = {
        environment = "prod"
      }
      secret_data = var.GITHUB_APP_INSTALLATION_ID
    }
  }
  project_id = var.project_id
}

module "trigger" {
  source = "../terraform-modules-gcp/cloudbuild_trigger"

  location                    = var.location
  connection_name             = var.cloudbuild_connection_name
  app_installation_id         = var.github_app_installation_id
  oauth_token_secret_version  = var.github_oauth_token
  repository_name             = var.cloudbuild_repository_name
  repo_remote_uri             = var.cloudbuild_repo_remote_uri
  trigger_cloudbuild_filename = var.cloudbuild_trigger_filename
  service_account             = var.service_account
  service_accounts            = module.service_account.service_account_names
  secrets                     = module.secret_manager.secret_versions
  depends_on = [
    module.service_account,
    module.secret_manager
  ]
}

module "cloud_run_service" {
  source = "../terraform-modules-gcp/cloud_run_v2_service"

  for_each             = var.cloudRun
  name                 = each.key
  location             = each.value.location
  deletion_protection  = each.value.deletion_protection
  invoker_iam_disabled = each.value.invoker_iam_disabled
  scaling              = try(each.value.scaling, null)
  containers           = each.value.containers
}

module "service_account" {
  source          = "../terraform-modules-gcp/iam_service_account"
  service_account = var.sa
}