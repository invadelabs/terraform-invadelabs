provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

provider "google" {
  project = "invadelabs"
  region  = "us-west1"
  zone    = "us-west1-a"
}
