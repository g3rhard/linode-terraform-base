#cloud-config
users:
  - name: ${gh_username}
    shell: /usr/bin/bash
    ssh_import_id: gh:${gh_username}
    sudo: ALL=(ALL:ALL) NOPASSWD:ALL

chpasswd:
  expire: false

apt_upgrade: true
apt:
  sources:
    hashicorp:
      source: deb [trusted=yes] https://apt.releases.hashicorp.com focal main
    speedtest:
      source: deb [trusted=yes] https://packagecloud.io/ookla/speedtest-cli/ubuntu focal main
    tailscale:
      source: deb [trusted=yes] https://pkgs.tailscale.com/stable/ubuntu focal main

packages:
  - traceroute
  - mediainfo
  - speedtest
  - tailscale
  - screen
  - unzip
  - whois
  - curl
  - file
  - htop
  - tree
  - wget
  - git
  - jq

runcmd:
  - ufw --force reset
  - ufw allow in on tailscale0 to any
  - ufw --force enable
