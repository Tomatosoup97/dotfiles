#!/bin/bash
set -e

# Repos
sudo dnf install -y fedora-workstation-repositories

# Flatpak
sudo dnf install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
