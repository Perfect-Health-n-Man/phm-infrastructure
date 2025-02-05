resource "google_cloudbuild_trigger" "on_merged_main_build_deploy" {
  name     = "on-merged-main-build-apply"
  filename = "/cloud-build/build-deploy.yaml"

  github {
    owner = "Perfect-Health-n-Man"
    name  = "phm-backend"
    push {
      branch = "^main$"
    }
  }

  substitutions = {
    _GOOGLE_API_KEY      = var.GOOGLE_API_KEY
    _LANGFUSE_HOST       = var.LANGFUSE_HOST
    _LANGFUSE_PUBLIC_KEY = var.LANGFUSE_PUBLIC_KEY
    _LANGFUSE_SECRET_KEY = var.LANGFUSE_SECRET_KEY
    _DATA_STORE_ID       = var.DATA_STORE_ID
  }

  service_account = google_service_account.cloud_build.id

  location = local.location
}
