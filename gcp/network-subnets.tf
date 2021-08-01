resource "google_compute_subnetwork" "invadelabs-us-west1" {
  name          = "invadelabs"
  ip_cidr_range = "10.138.0.0/24"
  region        = "us-west1"
  network       = google_compute_network.invadelabs.id
}
