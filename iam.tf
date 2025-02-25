resource "google_service_account" "gke_service_account" {
  account_id   = "gke-sa"
  display_name = "GKE Service Account"
}

resource "google_project_iam_binding" "gke_role_binding" {
  project = var.project_id
  role    = "roles/container.nodeServiceAccount"

  members = [
    "serviceAccount:${google_service_account.gke_service_account.email}"
  ]
}
