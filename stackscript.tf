data "template_file" "script" {
  template = file("${path.module}/cloud-init.tpl")

  vars = {
    gh_username = var.gh_username
  }
}

data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  # Main cloud-config configuration file.
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = data.template_file.script.rendered
  }

  part {
    content_type = "text/x-shellscript"

    content = <<EOF
#!/bin/bash
/bin/echo "Hello World" >> /tmp/testfile.txt
EOF
  }

}

resource "linode_stackscript" "cloud_init" {
  label       = "cloud-init"
  description = "This StackScript takes a base64 encoded `userdata` variable which will be provided to `cloud-init` on boot."
  script      = chomp(file("${path.module}/stackscript.sh"))
  images      = ["linode/ubuntu22.04", "linode/ubuntu22.10"]
  rev_note    = "initial version"
  is_public   = var.public_stackscript
}
