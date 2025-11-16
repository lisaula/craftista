variable "project_id" {
  description = "ID of the project where the secrets will be created"
  type        = string
}

variable "secrets" {
  description = "Map of secrets to create along with their payloads"
  type = map(object({
    secret_id  = optional(string)
    labels     = optional(map(string), {})
    secret_data = string
  }))
  default = {}
}
