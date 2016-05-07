#!/usr/bin/env bash
set -e
set -u

# cmake, python-dev, build-essentials required by YCM

sudo apt-get update
sudo apt-get install \
    rxvt-unicode-256color \
    zsh \
    tmux \
    silversearcher-ag \
    xclip \
    git-extras \
    curl \
    sshfs \
    cmake \
    python-dev \
    build-essential \
    xdotool wmctrl \
    colortest \
    tig \
    vnstat \
    gparted \
    shellcheck \
    rofi \
    ranger \
    # Use gnome-settings daemon instead of keychain because of reasons
    gnome-settings-daemon \
    -y
