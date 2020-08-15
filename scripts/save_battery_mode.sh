#!/bin/bash
set -e

./turn_off_network.sh
sudo systemctl stop bluetooth
sudo systemctl start powertop
pkill conky
