resource "linode_stackscript" "install_base" {
  label       = "install_base"
  description = "Installs a base packages"
  script      = <<EOF
#!/bin/bash
# <UDF name="package" label="System Package to Install" example="nginx" default="">
apt-get -q update && apt-get -q -y install $PACKAGE
EOF
  images      = ["linode/ubuntu22.04", "linode/ubuntu22.10"]
  rev_note    = "initial version"
}