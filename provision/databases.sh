#!/bin/bash
set -e

# Postgres
sudo dnf install -y postgresql-server postgresql-contrib
sudo postgresql-setup --initdb --unit postgresql

# Redis
sudo dnf -y install redis
