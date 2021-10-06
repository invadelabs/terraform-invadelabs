## cloudflare_email
resource "google_secret_manager_secret" "cloudflare_email" {
  secret_id = "cloudflare_email"
  replication {
    automatic = true
  }
}

data "google_secret_manager_secret_version" "cloudflare_email" {
  provider = google
  secret   = "cloudflare_email"
}

## cloudflare_api_key
resource "google_secret_manager_secret" "cloudflare_api_key" {
  secret_id = "cloudflare_api_key"
  replication {
    automatic = true
  }
}

data "google_secret_manager_secret_version" "cloudflare_api_key" {
  provider = google
  secret   = "cloudflare_api_key"
}
