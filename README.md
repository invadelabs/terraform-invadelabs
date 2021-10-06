# terraform-invadelabs

Terraform config for invadelabs.com with state hosted on terraform io, gcp for compute, and cloudflare for DNS and firewall.

Uses google-cloud-sdk for authentication and gcp secrets manager to avoid storing secrets in vars.
