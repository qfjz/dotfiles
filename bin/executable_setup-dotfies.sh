#!/usr/bin/env bash

[[ -d ~/.local/share/chezmoi ]] && rm -rf ~/.local/share/chezmoi

export GITHUB_USERNAME=qfjz
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
