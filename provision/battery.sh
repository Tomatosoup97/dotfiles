#!/bin/bash
set -e

sudo dnf install -y tlp tlp-rdw
sudo dnf install -y powertop
sudo systemctl stop bluetooth
sudo systemctl disable bluetooth
# nmcli radio wifi off  # disable wifi
