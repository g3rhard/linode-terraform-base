resource "linode_stackscript" "ansible_provision" {
  label       = "cloud-init"
  description = "This StackScript run Ansible playbooks from repo"
  script      = chomp(file("${path.module}/stackscript.sh"))
  images      = ["linode/ubuntu22.04", "linode/ubuntu22.10"]
  rev_note    = "initial version"
  is_public   = var.public_stackscript
}
