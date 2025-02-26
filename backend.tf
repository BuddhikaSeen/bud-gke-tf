terraform {
  backend "gcs" {
    bucket  = "bud-terraform-state-bucket"
    prefix  = "gke-cluster"
    # credentials = "~/terraform-key.json"
  }
}
