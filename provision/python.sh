#!/bin/bash
set -e

sudo dnf install -y python-pip
sudo dnf install -y python3-virtualenv
sudo pip install -r requirements.txt
sudo dnf install -y python-devel
sudo dnf install -y libdmtx  # mypy requires that

# Python build deps
sudo dnf install -y make gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel

# Pyenv
curl https://pyenv.run | bash
