#!/bin/bash
set -e

# KeepassX
sudo dnf install -y keepassxc

# Spotify
sudo flatpak install flathub com.spotify.Client

# Gimp
sudo dnf install -y gimp

# Google Chrome
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install -y google-chrome-stable

# Transmission
sudo dnf install transmission-gtk
