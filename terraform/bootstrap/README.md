# Overview

This will create the initial Linode's S3 object storage, which terraform will use ([S3 docs](https://www.terraform.io/docs/backends/types/s3.html)) for hosting the remote [terraform state](https://www.terraform.io/language/settings/backends/configuration).

## Setup

### Local Development

Follow steps from [here](../README.md#local-development).

### Linode PAT

Generate a [Linode PAT (Personal Access Token)](https://www.linode.com/docs/products/tools/linode-api/guides/get-access-token/)

## Bootstrap

1. After doing the [local setup](#local-development), you can then run `terraform plan` (if you want to see what it'll create)
2. `terraform apply` and type `yes` if everything looks good
3. To grab the access & secret key you can run the following command: `terraform output -raw bucket_access_key && echo && terraform output -raw bucket_secret_key`
4. Then this guide tells you how you need to format your backend.tf: <https://adriano.fyi/post/2020-05-29-how-to-use-linode-object-storage-as-a-terraform-backend/>
    - an example is [here](../dns/backend.tf)
5. Fill in the .envrc template at the root of the terraform directory with these keys
