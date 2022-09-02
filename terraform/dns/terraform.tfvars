# subdomains to create for ssh_show domain in cloudflare
ssh_show_subdomains = {
    "terraformtest1" = {
        name = "testssh1"
        proxied = true
        value = "45.79.147.12"
        type = "A"
    }
    "terraformtest2" = {
        name = "testssh2"
        proxied = false
        value = "1.1.1.1"
        type = "A"
    }
}

jb_com_subdomains = {
    "terraformtest1" = {
        name = "testjbcom1"
        proxied = true
        value = "45.79.147.12"
        type = "A"
    }
    "terraformtest2" = {
        name = "coderradio1"
        proxied = false
        value = "1.1.1.1"
        type = "A"
    }
}