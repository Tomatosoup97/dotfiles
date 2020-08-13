#!/bin/bash
set -e

./turn_on_network.sh
sudo systemctl stop bluetooth
sudo systemctl start powertop
pkill conky
