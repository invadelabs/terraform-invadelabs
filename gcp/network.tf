resource "google_compute_network" "default" {
  name                    = "default"
  description = "Default network for the project"
  auto_create_subnetworks = "false"
}

resource "google_compute_project_default_network_tier" "default" {
  network_tier = "STANDARD"
}

resource "google_compute_address" "invadelabs-ext" {
  name = "invadelabs-ext"
  description = "static external ip for invadelabs.com"
  network_tier = "STANDARD"
}
