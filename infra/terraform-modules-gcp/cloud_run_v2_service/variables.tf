variable "name" {
  type        = string
  description = "The name of the Cloud Run service"
}

variable "location" {
  type        = string
  description = "The location of the Cloud Run service"
}

variable "deletion_protection" {
  type        = bool
  default     = false
  description = "Whether to enable deletion protection for the Cloud Run service"
}

variable "invoker_iam_disabled" {
  type        = bool
  default     = false
  description = "Whether to disable IAM for invokers"
}

variable "scaling" {
  type = object({
    manual_instance_count = optional(number)
    max_instance_count    = optional(number)
    min_instance_count    = optional(number)
  })
  default     = null
  description = "Scaling configuration for the Cloud Run service"
}

variable "containers" {
  type = list(object({
    name  = string
    image = string
    port  = number
    startup_probe = optional(object({
      initial_delay_seconds = optional(number)
      timeout_seconds       = optional(number)
      period_seconds        = optional(number)
      failure_threshold     = optional(number)
      tcp_socket = optional(object({
        port = number
      }))
    }))
    liveness_probe = optional(object({
      http_get = optional(object({
        path = string
      }))
    }))
  }))
  description = "List of container configurations for the Cloud Run service"
}