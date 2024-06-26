#!/bin/bash
set -e

# KeepassX
sudo dnf install -y keepassxc

# Spotify
sudo snap install spotify

# Gimp
sudo dnf install -y gimp

# Google Chrome
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install -y google-chrome-stable

# Transmission
sudo dnf install transmission-gtk

# Calibre
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# VLC
sudo dnf install -y vlc

# Telegram
sudo dnf install -y telegram-desktop

# Zulip
# sudo snap install zulip

# Wireshark
sudo dnf install -y wireshark

# Anki
# download: https://apps.ankiweb.net/
# needed for audio:
sudo dnf install -y mplayer mencoder

# inkspace
# sudo snap install inkscape
