# linode-terraform-base

[![tfsec][badge-gh-actions-tfsec]][link-gh-actions-tfsec]

## Requirements

[![Terraform - >1.3.6](https://img.shields.io/badge/Terraform->1.3.6-5835CC?logo=terraform)](https://terraform.io)

## Linode

### Get the regions

```sh
curl https://api.linode.com/v4/regions -s | jq '.data[].id'
```

### Get the list of public images

```sh
curl https://api.linode.com/v4/images -s | jq '.data[].id'
```

### Get the list of instances types (linodes)

```sh
curl https://api.linode.com/v4/linode/types -s | jq '.data[].id'
```

[badge-gh-actions-tfsec]: https://github.com/g3rhard/linode-terraform-base/actions/workflows/tfsec.yml/badge.svg?branch=production
[link-gh-actions-tfsec]: https://github.com/g3rhard/linode-terraform-base/actions?query=workflow%3Atfsec
