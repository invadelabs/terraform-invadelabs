resource "improvmx_domain" "invadelabs" {
  domain = "invadelabs.com"
}

resource "improvmx_email_forward" "invadelabs_wilcard" {
  domain            = improvmx_domain.invadelabs.id
  alias_name        = "*"
  destination_email = "drewderivative@gmail.com"
}
