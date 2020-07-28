#!/bin/bash
set -e

echo "Please log out to apply changes. i3-msg exit, assumig i3 is already installed"
echo ""
echo "WARNING: Manual steps required to finish machine provisioning!"
echo ""
echo "Install Iosevka font"
echo "https://github.com/be5invis/Iosevka"
echo ""
echo "Install Toggl"
echo "https://github.com/toggl/toggldesktop#linux"
echo ""
echo "Install Slack"
echo "https://slack.com/intl/en-pl/downloads/linux"
echo ""
echo "Install docker compose"
echo "https://docs.docker.com/compose/install/#install-compose-on-linux-systems"
echo ""
echo "Setup google chrome profile"
echo ""
echo "Setup ssh keys"
echo ""
echo "Backlight setup"
echo 'sudo find /sys/ -type f -iname "brightness" | grep pci'
echo 'ln -s <intel backlight> /sys/class/backlight'
echo ""
