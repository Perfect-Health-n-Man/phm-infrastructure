resource "google_service_account" "cloud_build" {
  account_id   = "cloud-build"
  display_name = "Service account for Cloud Build"
}

resource "google_project_iam_member" "cloudbuild_service_account_cloudbuild_builder" {
  member  = "serviceAccount:${google_service_account.cloud_build.email}"
  project = var.PROJECT_ID
  role    = "roles/cloudbuild.builds.builder"
}

resource "google_project_iam_member" "cloudbuild_service_account_run_admin" {
  member  = "serviceAccount:${google_service_account.cloud_build.email}"
  project = var.PROJECT_ID
  role    = "roles/run.admin"
}

resource "google_service_account_iam_member" "iam_service_account_user" {
  member             = "serviceAccount:${google_service_account.cloud_build.email}"
  role               = "roles/iam.serviceAccountUser"
  service_account_id = google_service_account.phm_backend.id
}

resource "google_service_account" "phm_backend" {
  account_id   = "phm-backend"
  display_name = "Service account for phm-backend on Cloud Run"
}

resource "google_cloud_run_v2_service_iam_member" "member" {
  project  = var.PROJECT_ID
  location = local.location
  name     = google_cloud_run_v2_service.phm_backend.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}

resource "google_project_iam_member" "cloudbuild_service_account_discoveryengine_admin" {
  member  = "serviceAccount:${google_service_account.phm_backend.email}"
  project = var.PROJECT_ID
  role    = "roles/discoveryengine.admin"
}

resource "google_project_iam_member" "cloudbuild_service_account_datastore_user" {
  member  = "serviceAccount:${google_service_account.phm_backend.email}"
  project = var.PROJECT_ID
  role    = "roles/datastore.user"
}

resource "google_project_iam_member" "cloudbuild_service_account_firebaseauth_admin" {
  member  = "serviceAccount:${google_service_account.phm_backend.email}"
  project = var.PROJECT_ID
  role    = "roles/firebaseauth.admin"
}
