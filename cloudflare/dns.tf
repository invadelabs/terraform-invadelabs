resource "cloudflare_record" "root" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "invadelabs.com"
  value   = data.terraform_remote_state.gcp.outputs.invadelabs-ext-ip
  type    = "A"
  ttl     = 1 # 1 = automatic
  proxied = true
}

resource "cloudflare_record" "cgm" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "cgm"
  value   = "invadelabs.com"
  type    = "CNAME"
  ttl     = 1 # 1 = automatic
  proxied = true
}

resource "cloudflare_record" "drew" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "drew"
  value   = "invadelabs.com"
  type    = "CNAME"
  ttl     = 1 # 1 = automatic
  proxied = true
}

resource "cloudflare_record" "srv" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "srv"
  value   = "invadelabs.com"
  type    = "CNAME"
  ttl     = 120
  proxied = false
}

resource "cloudflare_record" "www" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "www"
  value   = "invadelabs.com"
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
  name    = "invadelabs.com"
  type    = "CAA"
  ttl     = 120
  proxied = false

  data = {
    "flags" = "0"
    "tag"   = "issuewild"
    "value" = "letsencrypt.org"
  }
}

###########################################################
## txt records
resource "cloudflare_record" "root_txt_keybase" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "invadelabs.com"
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
## mx records
resource "cloudflare_record" "root_mx_gmr" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "invadelabs.com"
  value   = "gmr-smtp-in.l.google.com"
  type    = "MX"
  ttl     = 120
  proxied = false
  priority = 5
}

resource "cloudflare_record" "root_mx_alt1" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "invadelabs.com"
  value   = "alt1.gmr-smtp-in.l.google.com"
  type    = "MX"
  ttl     = 120
  proxied = false
  priority = 10
}

resource "cloudflare_record" "root_mx_alt2" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "invadelabs.com"
  value   = "alt2.gmr-smtp-in.l.google.com"
  type    = "MX"
  ttl     = 120
  proxied = false
  priority = 20
}

resource "cloudflare_record" "root_mx_alt3" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "invadelabs.com"
  value   = "alt3.gmr-smtp-in.l.google.com"
  type    = "MX"
  ttl     = 120
  proxied = false
  priority = 30
}

resource "cloudflare_record" "root_mx_alt4" {
  zone_id = cloudflare_zone.invadelabs.id
  name    = "invadelabs.com"
  value   = "alt4.gmr-smtp-in.l.google.com"
  type    = "MX"
  ttl     = 120
  proxied = false
  priority = 40
}
