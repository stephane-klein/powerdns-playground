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


resource "powerdns_zone" "example_com" {
    name        = "example2.com."
    kind        = "Native"
}

resource "powerdns_record" "www_example_com" {
    zone    = powerdns_zone.example_com.name
    name    = "www.example.com."
    type    = "A"
    ttl     = 300
    records = ["192.168.0.11"]
}
