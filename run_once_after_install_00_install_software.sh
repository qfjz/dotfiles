#!/usr/bin/env bash

# ~/.local/bin/nvim --headless "+Lazy! sync" +qa

shopt -s nocasematch

read -p "Czy chcesz zainstalować pakiety i3 WM [t/n]: " -n1 ODP
case $ODP in
    t)
        $HOME/bin/install-i3.sh
        ;;
esac

echo
read -p "Czy chcesz zainstalować pakiety KDE [t/n]: " -n1 ODP
case $ODP in
    t)
        $HOME/bin/install-kde.sh
        ;;
esac

echo
read -p "Czy chcesz zainstalować pakiety devel [t/n]: " -n1 ODP
case $ODP in
    t)
        $HOME/bin/install-kde.sh
        ;;
esac

echo
read -p "Czy chcesz zainstalować flatpak i dodatkowe oprogramowanie [t/n]: " -n1 ODP
case $ODP in
    t)
        $HOME/bin/install-kde.sh
        ;;
esac

echo
read -p "Czy chcesz zainstalować czcionki [t/n]: " -n1 ODP
case $ODP in
    t)
        $HOME/bin/install-kde.sh
        ;;
esac
