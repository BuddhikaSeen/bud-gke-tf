provider "google" {
  project     = "bud-gke"
  region      = "us-central1"
}

# resource "google_project" "my_project" {
#   name       = "My Project"
#   project_id = "your-project-id"
#   #org_id     = "1234567"
# }

resource "google_compute_network" "vpc_network" {
  name = "vpc-network"
}

resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name          = "test-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.custom-test.id
  secondary_ip_range {
    range_name    = "tf-test-secondary-range-update1"
    ip_cidr_range = "192.168.10.0/24"
  }
}

resource "google_compute_network" "custom-test" {
  name                    = "test-network"
  auto_create_subnetworks = false
}


resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "static" {
  name          = "${random_id.bucket_prefix.hex}-new-bucket"
  location      = "US"
  storage_class = "COLDLINE"

  uniform_bucket_level_access = true
}


resource "google_compute_instance" "default" {
  name         = "my-vm-1"
  machine_type = "e2-micro"
  zone         = "us-central1-a"
  metadata_startup_script = file("./test.sh")
  tags                    = [
          "http-server",
          "ssh",
        ]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.id
    access_config {}
  }
}

#############

resource "google_compute_instance" "default-2" {
  name         = "my-vm-2"
  machine_type = "e2-micro"
  zone         = "us-central1-a"
  metadata_startup_script = file("./test-s.sh")
  tags                    = [
          "http-server",
          "ssh",
        ]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.id
    access_config {}
  }
}





### https://stackoverflow.com/questions/57682483/terraform-gcp-startup-script-local-file-instead-of-inline

