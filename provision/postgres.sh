#!/bin/bash
set -e

sudo dnf install -y postgresql-server postgresql-contrib
sudo postgresql-setup --initdb --unit postgresql
