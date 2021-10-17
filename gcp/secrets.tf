## cloudflare
resource "google_secret_manager_secret" "cloudflare" {
  secret_id = "cloudflare"
  replication {
    automatic = true
  }
}

data "google_secret_manager_secret_version" "cloudflare" {
  provider = google
  secret   = "cloudflare"
}
