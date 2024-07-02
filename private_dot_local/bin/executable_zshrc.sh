#!/usr/bin/env bash

# Tworzy symlink do pliku konfiguracyjnego ~/.config/zsh/zshrc

DATA=$(date +%F-%T|tr : -)

if [[ -f $HOME/.zshrc ]] && [[ ! -L $HOME/.zshrc ]]; then
    mv $HOME/.zshrc $HOME/.backup/.zshrc-$DATA
    ln -sf $HOME/.config/zsh/zshrc $HOME/.zshrc
else
    ln -sf $HOME/.config/zsh/zshrc $HOME/.zshrc
fi
