resource "google_secret_manager_secret" "cloudflare_email" {
  secret_id = "cloudflare_email"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret" "cloudflare_api_key" {
  secret_id = "cloudflare_api_key"
  replication {
    automatic = true
 } 
}
