resource "google_compute_firewall" "http-server" {
  name = "default-allow-http"
  target_tags = ["http-server"]
  network = google_compute_network.default.id

  allow {
    protocol = "tcp"
    ports = ["80"]
  }
}

resource "google_compute_firewall" "https-server" {
  name = "default-allow-https"
  target_tags = ["https-server"]
  network = google_compute_network.default.id

  allow {
    protocol = "tcp"
    ports = ["443"]
  }
}
