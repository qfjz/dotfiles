#!/usr/bin/env bash

# INFO: Skrypt pobierający informacje o repozytorium Git

. $HOME/bin/functions.sh

if [ "$1" == "vim" ]; then
    check_git_url vim
    check_git_dir vim
    check_git_user_name vim
    check_git_user_email vim
    check_git_sigkey vim
else
    check_git_url
    check_git_dir
    check_git_user_name
    check_git_user_email
    check_git_sigkey
fi
