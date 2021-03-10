#!/bin/bash
set -e

./turn_off_network
sudo systemctl stop bluetooth
sudo systemctl stop dockerd
sudo systemctl start powertop
pkill conky
