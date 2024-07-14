#!/usr/bin/env bash

# ~/.local/bin/nvim --headless "+Lazy! sync" +qa

shopt -s nocasematch

read -p "Czy chcesz zainstalować pakiety i3 WM [T/n]: " -n1 ODP
case $ODP in
    t)
        echo
        $HOME/bin/install-i3.sh
        ;;
    n)
        ;;
    *)
        echo
        $HOME/bin/install-i3.sh
        ;;
esac

echo
read -p "Czy chcesz zainstalować pakiety KDE [T/n]: " -n1 ODP
case $ODP in
    t)
        echo
        $HOME/bin/install-kde.sh
        ;;
    n)
        ;;
    *)
        echo
        $HOME/bin/install-kde.sh
        ;;
esac

echo
read -p "Czy chcesz zainstalować pakiety devel [T/n]: " -n1 ODP
case $ODP in
    t)
        echo
        $HOME/bin/install-kde.sh
        ;;
    n)
        ;;
    *)
        echo
        $HOME/bin/install-kde.sh
        ;;
esac

echo
read -p "Czy chcesz zainstalować flatpak i dodatkowe oprogramowanie [T/n]: " -n1 ODP
case $ODP in
    t)
        echo
        $HOME/bin/install-kde.sh
        ;;
    n)
        ;;
    *)
        echo
        $HOME/bin/install-kde.sh
        ;;
esac

echo
read -p "Czy chcesz zainstalować czcionki [T/n]: " -n1 ODP
case $ODP in
    t)
        echo
        $HOME/bin/install-kde.sh
        ;;
    n)
        ;;
    *)
        echo
        $HOME/bin/install-kde.sh
        ;;
esac
