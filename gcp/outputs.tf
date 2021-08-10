output "invadelabs-ext-ip" {
  value = google_compute_address.invadelabs-ext.address
}

output "cloudflare_email_secret" {
  value     = data.google_secret_manager_secret_version.cloudflare_email.secret_data
  sensitive = true
}

output "cloudflare_api_key_secret" {
  value     = data.google_secret_manager_secret_version.cloudflare_api_key.secret_data
  sensitive = true
}

output "improvmx_api_key" {
  value     = data.google_secret_manager_secret_version.improvmx_api_key.secret_data
  sensitive = true
}

output "my_public_ip" {
  value = data.external.myipaddr.result.ip
}
