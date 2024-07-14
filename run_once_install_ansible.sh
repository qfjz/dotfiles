#!/usr/bin/env bash

sudo dnf install -y ansible

# ansible-playbook ~/.bootstrap/setup.yml --ask-become-pass

echo "Ansible installation complete."
