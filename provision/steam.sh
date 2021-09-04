#!/bin/bash
# That's what I needed to do when installing on Thinkpad
set -e

# sudo dnf module reset nodejs
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y steam
