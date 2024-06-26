#!/bin/bash
set -e

# Core plugins
sudo dnf -y install dnf-plugins-core

# Repos
sudo dnf install -y fedora-workstation-repositories

# Flatpak
sudo dnf install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# RPM Fusion
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

# Snap
sudo dnf install -y snapd
sudo ln -s /var/lib/snapd/snap /snap

# System upgrade manager
sudo dnf install -y dnf-plugin-system-upgrade
sudo dnf install -y remove-retired-packages
sudo dnf install -y symlinks


# Distribute repos
sudo cp repos/* /etc/yum.repos.d/
