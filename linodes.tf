resource "linode_instance" "instance" {
  image           = var.image
  label           = "instance"
  region          = var.region
  type            = "g6-nanode-1"
  authorized_keys = var.authorized_keys
  root_pass       = var.root_pass
  stackscript_id  = linode_stackscript.cloud_init.id

}
