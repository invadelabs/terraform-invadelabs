resource "google_compute_network" "invadelabs" {
  name                    = "invadelabs"
  description             = "network for invadelabs"
  auto_create_subnetworks = "false"
}

resource "google_compute_project_default_network_tier" "invadelabs" {
  network_tier = "STANDARD"
}

resource "google_compute_address" "invadelabs-ext" {
  name         = "invadelabs-ext"
  description  = "static external ip for invadelabs.com"
  network_tier = "STANDARD"
}
