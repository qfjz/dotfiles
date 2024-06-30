#!/usr/bin/env bash

if command -v ansible-playbook &> /dev/null; then
    # ansible-playbook {{ joinPath .chezmoi.sourceDir "dot_bootstrap/setup.yml" | quote }} --ask-become-pass
    # ansible-playbook "$HOME/.local/share/chezmoi/dot_bootstrap/setup.yml" --ask-become-pass
    echo OK
fi
