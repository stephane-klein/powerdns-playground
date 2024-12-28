terraform {
  required_providers {
    powerdns = {
      source = "pan-net/powerdns"
    }
  }
}

provider "powerdns" {
    api_key    = "password"
    server_url = "http://51.15.223.53:8081"
}


resource "powerdns_zone" "foobar" {
    name        = "example2.com."
    kind        = "Native"
}

resource "powerdns_record" "www_example2_com" {
    zone    = "example2.com."
    name    = "www.example2.com."
    type    = "A"
    ttl     = 300
    records = ["192.168.0.11"]
}
