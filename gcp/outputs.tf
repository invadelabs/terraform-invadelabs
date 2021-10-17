output "invadelabs-ext-ip" {
  value = google_compute_address.invadelabs-ext.address
}

output "cloudflare" {
  value     = jsondecode(data.google_secret_manager_secret_version.cloudflare.secret_data)
  sensitive = true
}

output "my_public_ip" {
  value = data.external.myipaddr.result.ip
}
