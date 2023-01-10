#!/bin/bash
set -e

sudo dnf -y copr enable dani/qgis
sudo dnf -y install qgis python3-qgis qgis-grass
