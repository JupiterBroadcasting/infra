# docs: https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record

# subdomains to create for jb_com domain in cloudflare
jb_com_subdomains = {
# A Records
    "jbcom" = {
        name = "@"
        value = "45.79.147.12"
        type = "A"
        proxied = true
        ttl = 1
    }

    "archive" = {
        name = "archive"
        value = "23.92.19.250"
        type = "A"
        proxied = true
        ttl = 1
    }

    "colony" = {
        name = "colony"
        value = "45.79.76.52"
        type = "A"
        proxied = false
        ttl = 1
    }

    "core" = {
        name = "core"
        value = "45.79.147.12"
        type = "A"
        proxied = false
        ttl = 1
    }

    "dev" = {
        name = "dev"
        value = "45.79.206.17"
        type = "A"
        proxied = false
        ttl = 1
    }

    "donate" = {
        name = "donate"
        value = "24.16.90.47"
        type = "A"
        proxied = false
        ttl = 1
    }

    "legacy" = {
        name = "legacy"
        value = "216.66.43.105"
        type = "A"
        proxied = false
        ttl = 1
    }

    "netdata" = {
        name = "netdata"
        value = "23.92.19.250"
        type = "A"
        proxied = false
        ttl = 1
    }

    "notes" = {
        name = "notes"
        value = "45.79.147.12"
        type = "A"
        proxied = true
        ttl = 1
    }

    "status" = {
        name = "status"
        value = "50.116.37.88"
        type = "A"
        proxied = true
        ttl = 1
    }

    "test.dev" = {
        name = "test.dev"
        value = "45.79.206.17"
        type = "A"
        proxied = true
        ttl = 1
    }

    "www" = {
        name = "www"
        value = "45.79.147.12"
        type = "A"
        proxied = true
        ttl = 1
    }

# AAAA Records
    "archive" = {
        name = "archive"
        value = "2600:3c03::f03c:93ff:fe35:667b"
        type = "AAAA"
        proxied = true
        ttl = 1
    }

    "dev" = {
        name = "dev"
        value = "2600:3c03::f03c:93ff:fe35:667b"
        type = "AAAA"
        proxied = true
        ttl = 1
    }

    "netdata" = {
        name = "netdata"
        value = "2600:3c03::f03c:93ff:fe35:667b"
        type = "AAAA"
        proxied = false
        ttl = 1
    }

# CNAME Records
    "new" = {
        name = "new"
        value = "jupiterbroadcasting.com"
        type = "CNAME"
        proxied = true
        ttl = 1
    }

# TXT Records
}

# subdomains to create for ssh_show domain in cloudflare
ssh_show_subdomains = {}

jb_com_pagerules = {
  "new-jb-com" = {
    target        = "new.jupiterbroadcasting.com"
    forwarded_url = "https://www.jupiterbroadcasting.com"
    status_code   = "301"
    priority = 2
  }
  "www-jb-com" = {
    target        = "jupiterbroadcasting.com"
    forwarded_url = "https://www.jupiterbroadcasting.com"
    status_code   = "301"
    priority = 1
  }
}