# Overview

## In this repo

There are accompanying README.md files in the different terraform directories.

They in general cover:

- what terraform is
- how to setup the local development environment so it's similar to the CI
- the current required CI environment variables needing to be setup in the GH repo's settings

## What is terraform?

[![what is terraform](http://img.youtube.com/vi/HmxkYNv1ksg/0.jpg)](https://youtu.be/HmxkYNv1ksg "What is terraform")

## Setup

### Local Development

- Install terraform: <https://learn.hashicorp.com/tutorials/terraform/install-cli>
- Install direnv: <https://direnv.net/#basic-installation>
  - :arrow_up: is used to help [export necessary environment variables](https://direnv.net/#how-it-works).
- Copy all the .envrc.template files to .envrc
- Fill out information you can (initial bootstrap will just be [Linode PAT](bootstrap/README.md#linode-pat))
- When following a guide, make sure you cd into the guide's directory
- do a `direnv allow .` (after you've looked at the file to check for malicious code), after you've filled out the .envrc file with the needed information

### CI

1. Run the [bootstrap steps](bootstrap/README.md) locally, so you can bootstrap terraform's remote state
2. Define necessary [environment variables](https://blog.elreydetoda.site/github-action-security/)
3. API tokens needed so far are:
    - AWS_ACCESS_KEY_ID = your linode s3 access key (follow the [bootstrap notes](bootstrap/README.md) to get this)
    - AWS_SECRET_ACCESS_KEY = your linode s3 secret key (follow the [bootstrap notes](bootstrap/README.md) to get this)
    - CLOUDFLARE_API_KEY = your cloudflare API key (guide [here](dns/README.md#cloudflare-api-key) on how to create)

([here](https://docs.github.com/en/actions/security-guides/security-hardening-for-github-actions) are some security guidelines from GitHub on hardening GitHub Actions (also environment variables).)
