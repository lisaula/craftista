variable "instance_name" {
  description = "SQL DB instance name"
  type        = string
}

variable "database_version" {
  description = "SQL DB Instance version (e.g. Postgres 17)"
  type        = string
  default     = "POSTGRES_15"
}

variable "region" {
  description = "Region where DB instance is created"
  type        = string
  default     = "northamerica-south1"
}

variable "database_name" {
  description = "Name of database created in SQL DB instance"
  type        = string
}

variable "tier" {
  description = "DB Instance tier to be created"
  type        = string
  default     = "db-f1-micro"
}

variable "deletion_policy" {
  description = "Deletion policy can be ABANDON or DELETE, in Postgres DBs cannot be deleted if there are more users than the cloud default user"
  type        = string
  default     = "ABANDON"
}

variable "edition" {
  description = "DB Instance Tier Edition"
  type        = string
  default     = "ENTERPRISE"
}

variable "db_username" {
  description = "Database username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database user password"
  type        = string
  sensitive   = true
}

variable "deletion_protection" {
  description = "Whether to enable deletion protection on the SQL instance"
  type        = bool
  default     = false
}
