#!/usr/bin/env bash

if [[ ! $(command -v ansible-playbook) ]]; then
    sudo dnf install -y ansible
fi

if [[ ! -f $HOME/.config/chezmoi/installed ]]; then
    ansible-playbook ~/.bootstrap/setup.yml --ask-become-pass
fi
