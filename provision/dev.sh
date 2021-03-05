#!/bin/bash
set -e

# Dev packages
sudo dnf install -y @development-tools

# Git
sudo dnf install -y git-review
sudo dnf install -y tig

# Subl
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf install -y sublime-text

# Atom
sudo snap install atom --classic
apm install teletype
apm install vim-mode-plus

# Toggl
flatpak install -y flathub com.toggl.TogglDesktop

# LLVM
# sudo dnf install -y llvm10-devel llvm10-static python-lit
# pip install --user llvmlite

# Terraform
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
sudo dnf install -y terraform
