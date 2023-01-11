#!/bin/sh
# <UDF name="SERVER_TYPE" label="server type for provision" />
# <UDF name="GH_USERNAME" label="github username for import keys" />

set -e

# Variables
PROVISION_REPO="https://github.com/g3rhard/terraform-ansible-provision.git"

echo "Provision started at $(date)" >> /tmp/provision.log 2>&1

# Install pre-requisites
apt update && apt install -y ansible python-pip git htop mc jq zsh tmux >> /tmp/provision.log 2>&1

# Import SSH identity
ssh-import-id gh:${GH_USER} >> /tmp/provision.log 2>&1

# Clone repo with playbooks
git clone --depth 1 ${PROVISION_REPO} .provision >> /tmp/provision.log 2>&1
# Define Host
mkdir /etc/ansible
echo "[$SERVER_TYPE]" | tee -a /etc/ansible/hosts
echo "localhost ansible_connection=local" | tee -a /etc/ansible/hosts

# Ansible-galaxy
ansible-galaxy install -r ".provision/$SERVER_TYPE/requirements.yml" >> /tmp/provision.log 2>&1
ansible-playbook ".provision/$SERVER_TYPE/provision.yaml" >> /tmp/provision.log 2>&1

echo > /tmp/provision.finished
