## home_assistant_allow_amazon
resource "cloudflare_filter" "home_assistant_allow_amazon" {
  zone_id     = cloudflare_zone.invadelabs.id
  description = "Home Assistant - Allow Amazon"
  expression  = "(ip.geoip.asnum eq 16509) or (ip.geoip.asnum eq 21928)"
}

resource "cloudflare_firewall_rule" "home_assistant_allow_amazon" {
  zone_id     = cloudflare_zone.invadelabs.id
  description = "Home Assistant - Allow Amazon"
  filter_id   = cloudflare_filter.home_assistant_allow_amazon.id
  action      = "allow"
}

## block_china
resource "cloudflare_filter" "block_china" {
  zone_id     = cloudflare_zone.invadelabs.id
  description = "Block China"
  expression  = "(ip.geoip.country eq \"CN\")"
}

resource "cloudflare_firewall_rule" "block_china" {
  zone_id     = cloudflare_zone.invadelabs.id
  description = "Block China"
  filter_id   = cloudflare_filter.block_china.id
  action      = "block"
}

## block_bad_bots
resource "cloudflare_filter" "block_bad_bots" {
  zone_id     = cloudflare_zone.invadelabs.id
  description = "Block Bad Bots"
  expression  = "(http.user_agent contains \"Yandex\") or (http.user_agent contains \"muckrack\") or (http.user_agent contains \"Qwantify\") or (http.user_agent contains \"Sogou\") or (http.user_agent contains \"BUbiNG\") or (http.user_agent contains \"knowledge\") or (http.user_agent contains \"CFNetwork\") or (http.user_agent contains \"Scrapy\") or (http.user_agent contains \"SemrushBot\") or (http.user_agent contains \"AhrefsBot\") or (http.user_agent contains \"Baiduspider\") or (http.user_agent contains \"python-requests\") or (http.user_agent contains \"crawl\" and not cf.client.bot) or (http.user_agent contains \"Crawl\" and not cf.client.bot) or (http.user_agent contains \"bot\" and not http.user_agent contains \"bingbot\" and not http.user_agent contains \"Google\" and not http.user_agent contains \"Twitter\" and not cf.client.bot) or (http.user_agent contains \"Bot\" and not http.user_agent contains \"Google\" and not cf.client.bot) or (http.user_agent contains \"Spider\" and not cf.client.bot) or (http.user_agent contains \"spider\" and not cf.client.bot)"
}

resource "cloudflare_firewall_rule" "block_bad_bots" {
  zone_id     = cloudflare_zone.invadelabs.id
  description = "Block Bad Bots"
  filter_id   = cloudflare_filter.block_bad_bots.id
  action      = "block"
}

## us_only_cgm_ha
resource "cloudflare_filter" "us_only_cgm_ha" {
  zone_id     = cloudflare_zone.invadelabs.id
  description = "US only access to cgm and ha"
  expression  = "(http.host eq \"cgm.invadelabs.com\" and ip.geoip.country ne \"US\") or (http.host eq \"ha.invadelabs.com\" and ip.geoip.country ne \"US\")"
}

resource "cloudflare_firewall_rule" "us_only_cgm_ha" {
  zone_id     = cloudflare_zone.invadelabs.id
  description = "US only access to cgm and ha"
  filter_id   = cloudflare_filter.us_only_cgm_ha.id
  action      = "block"
}
