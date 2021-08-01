resource "google_compute_firewall" "inv-http-server" {
  name        = "invadelabs-allow-http"
  target_tags = ["http-server"]
  network     = google_compute_network.invadelabs.id

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}

resource "google_compute_firewall" "inv-https-server" {
  name        = "invadelabs-allow-https"
  target_tags = ["https-server"]
  network     = google_compute_network.invadelabs.id

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
}

resource "google_compute_firewall" "invadelabs-allow-icmp" {
  name        = "invadelabs-allow-icmp"
  network     = google_compute_network.invadelabs.id
  source_ranges = ["0.0.0.0/0"]
  priority = 65534

  allow {
    protocol = "icmp"
  }
}

resource "google_compute_firewall" "invadelabs-allow-internal" {
  name        = "invadelabs-allow-internal"
  network     = google_compute_network.invadelabs.id
  source_ranges = ["10.138.0.0/24"]
  priority = 65534

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports = ["0-65535"]
  }
}
