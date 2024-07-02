#!/usr/bin/env bash

# Tworzy linki symboliczne

read -r fedora < /etc/fedora-release
fedora_ver=$(echo "$fedora" | tr -cd '[:digit:][:cntrl:]')

FEDORA_BIN_DIR="$HOME/.local/bin/F$fedora_ver"

cd $FEDORA_BIN_DIR

for i in *; do
    if [[ -d $i ]]; then
        cd $i
        for i in *; do
            if [[ -x $i ]] && [[ ! -d $i ]]; then
                ln -sf $(readlink -m $i) ~/.local/bin/$i
            fi
        done
    fi
    cd $FEDORA_BIN_DIR
done
