#!/usr/bin/env bash

# Tworzy sesję Tmux o nazwie katalogu, który znajduje się na liście, tutaj ~/git/ i ~/workspace/

if [[ "$#" -eq 1 ]]; then
    selected="$1"
else
    items=$(find ~/git -maxdepth 1 -mindepth 1 -type d)
    items+=$(find ~/workspace -maxdepth 1 -mindepth 1 -type d)
    selected=$(echo "$items" | fzf)
fi

dirname=$(basename "$selected")

# nie uruchamia nowej sesji już w istniejącej sesji
tmux switch-client -t "$dirname"
if [[ "$?" -eq 0 ]]; then
    exit 0
fi

tmux new-session -c "$selected" -d -s "$dirname" && tmux switch-client -t "$dirname" || tmux new-session -c "$selected" -A -s "$dirname"
