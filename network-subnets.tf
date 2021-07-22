resource "google_compute_subnetwork" "default-us-east1" {
  name          = "default"
  ip_cidr_range = "10.142.0.0/20"
  region        = "us-east1"
  network       = google_compute_network.default.id
}

resource "google_compute_subnetwork" "default-us-central1" {
  name          = "default"
  ip_cidr_range = "10.128.0.0/20"
  region        = "us-central1"
  network       = google_compute_network.default.id
}

resource "google_compute_subnetwork" "default-us-west1" {
  name          = "default"
  ip_cidr_range = "10.138.0.0/20"
  region        = "us-west1"
  network       = google_compute_network.default.id
}

