sqlDbInstances = {
  "catalogue-db" = {
    database_version = "POSTGRES_17"
    region           = "northamerica-south1"
    tier             = "db-f1-micro"
    database_name    = "catalogue"
    deletion_policy  = "DELETE"
    username         = "CATALOGUE_DB_USERNAME_ID"
    password         = "CATALOGUE_DB_PASSWORD_ID"
  }
}