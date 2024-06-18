# moved to cdn XXX add record
# resource "cloudflare_record" "root" {
#   zone_id = cloudflare_zone.invadelabs.id
#   name    = "."
#   value   = data.terraform_remote_state.gcp.outputs.invadelabs-ext-ip
#   type    = "A"
#   ttl     = 1 # 1 = automatic
#   proxied = true
# }

resource "cloudflare_record" "cgm" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "cgm"
  value   = data.terraform_remote_state.gcp.outputs.invadelabs-ext-ip
  type    = "A"
  ttl     = 120
  proxied = false
}

resource "cloudflare_record" "drew" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "drew"
  value   = "srv.invadelabs.com"
  type    = "CNAME"
  ttl     = 1 # 1 = automatic
  proxied = true
}

resource "cloudflare_record" "plex" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "plex"
  value   = "192.168.1.125"
  type    = "A"
  ttl     = 120
  proxied = false
}

resource "cloudflare_record" "srv" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "srv"
  value   = data.terraform_remote_state.gcp.outputs.invadelabs-ext-ip
  type    = "A"
  ttl     = 120
  proxied = false
}

resource "cloudflare_record" "www" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "www"
  value   = "drew-h.pages.dev"
  type    = "CNAME"
  ttl     = 1 # 1 = automatic
  proxied = true
}

resource "cloudflare_record" "wiki" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "wiki"
  value   = "invadelabs.github.io"
  type    = "CNAME"
  ttl     = 120
  proxied = false
}

###########################################################
## sendgrid
resource "cloudflare_record" "m" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "m"
  value   = "u2912789.wl040.sendgrid.net"
  type    = "CNAME"
  ttl     = 120
  proxied = false
}

resource "cloudflare_record" "s1" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "s1._domainkey"
  value   = "s1.domainkey.u2912789.wl040.sendgrid.net"
  type    = "CNAME"
  ttl     = 120
  proxied = false
}

resource "cloudflare_record" "s2" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "s2._domainkey"
  value   = "s2.domainkey.u2912789.wl040.sendgrid.net"
  type    = "CNAME"
  ttl     = 120
  proxied = false
}

###########################################################
## letsencrypt
resource "cloudflare_record" "root_caa" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "."
  type    = "CAA"
  ttl     = 120
  proxied = false

  data {
    flags = "0"
    tag   = "issuewild"
    value = "letsencrypt.org"
  }
}

###########################################################
## txt records
resource "cloudflare_record" "root_txt_keybase" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "."
  value   = "keybase-site-verification=wNv2UgzGljNT31s0WJmv3WoELv1meybxL09IC-KZ9Ss"
  type    = "TXT"
  ttl     = 120
  proxied = false
}

resource "cloudflare_record" "root_txt_github" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "_github-challenge-invadelabs"
  value   = "4c967f95cc"
  type    = "TXT"
  ttl     = 120
  proxied = false
}


###########################################################
# XXX update mx records for cloudflare
