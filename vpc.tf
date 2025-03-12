

# Create a custom VPC (non-auto mode)
resource "google_compute_network" "vpc-vm" {
  name                    = "bud-vpc"
  auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "public_subnet-vm" {
  name          = "public-subnet-vm"
  region        = var.region
  network       = google_compute_network.vpc-vm.id
  ip_cidr_range = "10.0.1.0/24"

  private_ip_google_access = false
}


resource "google_compute_subnetwork" "private_subnet-vm" {
  name          = "private-subnet-vm"
  region        = var.region
  network       = google_compute_network.vpc-vm.id
  ip_cidr_range = "10.0.2.0/24"
  
  private_ip_google_access = true
}

## VM
resource "google_compute_instance" "vm_instance" {
  name         = "bud-vm-instance"
  machine_type = "f1-micro"
  zone         = var.zone
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = google_compute_network.vpc-vm.id
    subnetwork = google_compute_subnetwork.public_subnet-vm.id

    # allocate an ephemeral public IP address.
    access_config {}
  }

  metadata = {
    
    startup-script = "echo 'Hello, world!' > /var/tmp/hello.txt"
  }
}

