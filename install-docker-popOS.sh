#!/bin/bash

sudo apt update && sudo apt install -y docker.io docker-buildx docker-compose-v2
sudo usermod -aG docker $USER
sudo systemctl enable --now docker