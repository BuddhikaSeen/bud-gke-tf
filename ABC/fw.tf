# resource "google_compute_firewall" "default" {
#   name    = "bud-test-firewall"
#   network = google_compute_network.default.name

#   allow {
#     protocol = "icmp"
#   }

#   allow {
#     protocol = "tcp"
#     ports    = ["80", "22", "1000-2000"]
#   }

#   source_tags = ["ssh"]
# }

# resource "google_compute_network" "default" {
#   name = "bud-test-network"
# }