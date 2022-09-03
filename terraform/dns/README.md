# Overview

This is the Cloudflare terraform provider. Docs are here: <https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs>

## Setup

### Local Development

Follow steps from [here](../README.md#local-development).

### Cloudflare API Key

Once logged in to Cloudflare:

1. navigate [here](https://dash.cloudflare.com/profile/api-tokens)
2. Click "Create Token"
3. Click "Use template" for the "Edit zone DNS"
4. Click "+ Add more" under the "Permissions" section
5. Select the following options:
    - Zone
    - Page Rules
    - Edit
6. Select the specific zone to restrict access, or select "All zones" instead of "Specific zone"
7. (Optional) add more restrictions (might not be good idea though for CI)
8. Click "Continue to summary"
9. Click "Create Token"
10. Copy the token to a secure location, it won't be shown again