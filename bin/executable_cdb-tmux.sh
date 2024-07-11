#!/usr/bin/env bash

# Tworzy sesję Tmux o nazwie katalogu, który znajduje się na liście katalogów zawartej w pliku ~/.config/bmdirs

if [[ "$#" -eq 1 ]]; then
    selected="$1"
else
    selected="$(cat ~/.config/bmdirs|fzf --prompt "PWD: $PWD> "|sed "s|~|$HOME|")"
    [ ! -z $selected ] && cd -P -- "$selected"
fi

dirname=$(basename "$selected")
session_name=$(echo $dirname|tr -d '.')

# nie uruchamia nowej sesji już w istniejącej sesji
tmux switch-client -t "$session_name"
if [[ "$?" -eq 0 ]]; then
    exit 0
fi

tmux new-session -c "$selected" -d -s "$session_name" && tmux switch-client -t "$session_name" || tmux new-session -c "$selected" -A -s "$session_name"
