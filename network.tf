resource "google_compute_network" "vpc" {
  name                    = "private-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "private-subnet"
  network       = google_compute_network.vpc.id
  region        = var.region
  private_ip_google_access = true
}
