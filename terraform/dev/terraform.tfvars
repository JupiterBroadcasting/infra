
demo_nodename = "ssh-dev"

# subdomains to create for demo instance in cloudflare
show_subdomain = [
    "*.dev"
]

######
# Linode specific
## linode-cli images list
linode_image_ubu2004  = "linode/ubuntu20.04"

## linode-cli regions list
linode_region_us_east = "us-east"
linode_region_uk = "eu-west"

## linode-cli linodes types
linode_type_5usd_1gb = "g6-nanode-1"    #1vcpu, 1gb, 25gb
linode_type_10usd_2gb = "g6-standard-1" #1vcpu, 2gb, 50gb 
linode_type_20usd_4gb = "g6-standard-2" #2vcpu, 4gb, 80gb
linode_type_40usd_8gb = "g6-standard-2" #4vcpu, 8gb, 160gb