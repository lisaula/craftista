resource "google_service_account" "sa" {
  for_each     = var.service_account
  account_id   = each.key
  display_name = each.value.display_name
}


locals {
  sa_roles = flatten([
    for sa_key, sa_val in var.service_account : [
      for role in sa_val.google_roles : {
        sa_key     = sa_key
        role       = role
        project_id = sa_val.project_id
      }
    ]
  ])
}


resource "google_project_iam_binding" "binding" {
  for_each = { for idx, val in local.sa_roles : "${val.sa_key}-${val.role}" => val }
  project  = each.value.project_id
  role     = each.value.role

  members = [
    "serviceAccount:${google_service_account.sa[each.value.sa_key].email}"
  ]
}
