cloudRun = {
  "craftista" = {
    location             = "northamerica-south1"
    deletion_protection  = false
    invoker_iam_disabled = true
    scaling = {
      manual_instance_count = 0
      max_instance_count    = 1
      min_instance_count    = 1
    }
    containers = [
      {
        name  = "catalogue"
        image = "northamerica-south1-docker.pkg.dev/sodium-sublime-379101/cloud-run-source-deploy/craftista:main"
        port  = 5000
        startup_probe = {
          initial_delay_seconds = 0
          timeout_seconds       = 240
          period_seconds        = 240
          failure_threshold     = 1
          tcp_socket = {
            port = 5000
          }
        }
        liveness_probe = {
          http_get = {
            path = "/"
          }
        }
      }
    ]
  }
}