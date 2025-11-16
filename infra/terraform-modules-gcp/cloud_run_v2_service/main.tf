resource "google_cloud_run_v2_service" "this" {
  name                 = var.name
  location             = var.location
  deletion_protection  = var.deletion_protection
  invoker_iam_disabled = var.invoker_iam_disabled
  dynamic "scaling" {
    for_each = var.scaling != null ? [var.scaling] : []
    content {
      manual_instance_count = scaling.value.manual_instance_count
      max_instance_count    = scaling.value.max_instance_count
      min_instance_count    = scaling.value.min_instance_count
    }
  }

  template {
    dynamic "containers" {
      for_each = var.containers
      content {
        name  = containers.value.name
        image = containers.value.image
        dynamic "startup_probe" {
          for_each = containers.value.startup_probe != null ? [containers.value.startup_probe] : []
          content {
            initial_delay_seconds = startup_probe.value.initial_delay_seconds
            timeout_seconds       = startup_probe.value.timeout_seconds
            period_seconds        = startup_probe.value.period_seconds
            failure_threshold     = startup_probe.value.failure_threshold
            dynamic "tcp_socket" {
              for_each = startup_probe.value.tcp_socket != null ? [startup_probe.value.tcp_socket] : []
              content {
                port = tcp_socket.value.port
              }
            }
          }
        }
        dynamic "liveness_probe" {
          for_each = containers.value.liveness_probe != null ? [containers.value.liveness_probe] : []
          content {
            dynamic "http_get" {
              for_each = liveness_probe.value.http_get != null ? [liveness_probe.value.http_get] : []
              content {
                path = http_get.value.path
              }
            }
          }
        }
      }
    }
  }
}   