#!/bin/bash

# Install Docker
# echo "Installing Docker..."
# sudo apt update
# sudo apt install -y docker.io

# Install Docker-compose
# echo "Installing Docker-compose..."
# sudo apt install -y docker-compose

# Start Docker service
# echo "Starting Docker service..."
# sudo systemctl start docker
# sudo systemctl enable docker

# Create docker-compose.yaml file 
echo "Setting up containers using Docker-compose..."
sudo docker-compose up -d

echo "Setup complete!"
