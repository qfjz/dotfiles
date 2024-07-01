#!/usr/bin/env bash

read -r fedora < /etc/fedora-release
fedora_ver=$(echo "$fedora" | tr -cd '[:digit:][:cntrl:]')

echo $fedora_ver
