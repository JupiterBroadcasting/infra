terraform {
  backend "s3" {
    # this will be whatever you named the bucket
    bucket = "terraform-backend"
    # this NEEDS to be unique per folder, or else you'll overwrite terraform state
    #   (i.e. if we had a subfolder of foo it'd be: dns/foo/terraform.tfstate)
    #   (i.e. if we had a different folder (instead of dns) called bar it'd be: bar/terraform.tfstate)
    key    = "dns/terraform.tfstate"
    region = "us-east-1"
    endpoint = "us-east-1.linodeobjects.com"
    skip_credentials_validation = true
    # access_key = ""
    # secret_key = ""
    # instead of adding your creds in plain text use environment variables:
    #   AWS_ACCESS_KEY_ID & AWS_SECRET_ACCESS_KEY
  }
}