#!/bin/bash
set -e

# i3
sudo dnf install -y i3 i3status dmenu i3lock xbacklight feh conky

# ZSH
sudo dnf install -y zsh

# Tmux
sudo dnf install -y tmux

# xdotool
sudo dnf install -y xdotool

# ack
sudo dnf install -y ack

# inotify
sudo dnf install -y inotify-tools

# xclip
sudo dnf install -y xclip

# Redshift
sudo dnf install -y redshift

# ccrypt
sudo dnf install -y ccrypt

# Utils such as chsh (change default shell)
sudo dnf install -y util-linux-user

# ls hardware
sudo dnf install -y lshw

# audio control
sudo dnf install -y pavucontrol

# htop
sudo dnf install -y htop

# jq
sudo dnf install -y jq
