#!/bin/bash
set -e

# Thinkpad only steps

# TLP battery saver required steps
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://repo.linrunner.de/fedora/tlp/repos/releases/tlp-release.fc$(rpm -E %fedora).noarch.rpm

sudo dnf install -y acpi_call
sudo dnf install -y kernel-devel akmod-acpi_call akmod-tp_smapi
