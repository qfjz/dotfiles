#!/usr/bin/env bash

sudo dnf install -y ansible

if [[ ! -f $HOME/.config/chezmoi/installed ]]; then
    ansible-playbook ~/.bootstrap/setup.yml --ask-become-pass
fi
