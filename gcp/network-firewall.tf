resource "google_compute_firewall" "http-server" {
  name        = "allow-http"
  target_tags = ["http-server"]
  network     = google_compute_network.invadelabs.id

  source_ranges = data.terraform_remote_state.cloudflare.outputs.cloudflare_ip_ranges.ipv4_cidr_blocks

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}

resource "google_compute_firewall" "https-server" {
  name        = "allow-https"
  target_tags = ["https-server"]
  network     = google_compute_network.invadelabs.id

  source_ranges = data.terraform_remote_state.cloudflare.outputs.cloudflare_ip_ranges.ipv4_cidr_blocks

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
}

#resource "google_compute_firewall" "allow-icmp" {
#  name          = "allow-icmp"
#  network       = google_compute_network.invadelabs.id
#  source_ranges = ["0.0.0.0/0"]
#  priority      = 65534
#
#  allow {
#    protocol = "icmp"
#  }
#}

resource "google_compute_firewall" "allow-internal" {
  name          = "allow-internal"
  network       = google_compute_network.invadelabs.id
  source_ranges = ["${google_compute_subnetwork.invadelabs-us-west1.ip_cidr_range}", ]
  priority      = 65534

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
}

resource "google_compute_firewall" "allow-drew-nm1" {
  name    = "allow-drew-nm1"
  network = google_compute_network.invadelabs.id

  source_ranges = ["${data.external.myipaddr.result.ip}/32", ]

  allow {
    protocol = "tcp"
    ports    = ["22", "5666", "80", "443"]
  }

  allow {
    protocol = "icmp"
  }
}
