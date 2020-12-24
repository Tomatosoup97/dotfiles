#!/bin/bash
set -e

# Postgres
sudo dnf install -y postgresql-server postgresql-contrib
sudo postgresql-setup --initdb --unit postgresql

# Redis
sudo dnf -y install redis

# Elasticsearch
# sudo cp ./templates/elasticsearch.repo /etc/yum.repos.d/
# sudo dnf install -y --enablerepo=elasticsearch elasticsearch


# Start databases
# sudo systemctl start postgresql
# sudo systemctl start redis
# sudo systemctl start elasticsearch

# Enable databases
# sudo systemctl start postgresql
# sudo systemctl start redis
# sudo systemctl start elasticsearch
