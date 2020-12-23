#!/bin/bash

# Nodejs
sudo dnf module install -y nodejs:12

# Yarn
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo dnf install -y yarn
