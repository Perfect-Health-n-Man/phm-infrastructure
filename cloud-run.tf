resource "google_cloud_run_v2_service" "phm_backend" {
  name     = "phm-backend"
  location = local.location
  ingress = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
      ports {
        name = "http1"
        container_port = 5000
      }
    }
    timeout = "120s"
    service_account = google_service_account.phm_backend.email
  }
}
