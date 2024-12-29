terraform {
  required_providers {
    powerdns = {
      source = "pan-net/powerdns"
    }
  }
}

variable "powerdns_ip" {
  description = "Powerdns IP address"
  type        = string
}

provider "powerdns" {
    api_key    = "password"
    server_url = "http://${var.powerdns_ip}:8081"
}


resource "powerdns_zone" "example_com" {
    name        = "example.com."
    kind        = "Native"
}

resource "powerdns_record" "www_example_com" {
    zone    = powerdns_zone.example_com.name
    name    = "www.example.com."
    type    = "A"
    ttl     = 300
    records = ["192.168.0.11"]
}
