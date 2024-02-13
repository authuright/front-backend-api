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
echo "Starting create container for project."
cat <<EOF > docker-compose.yml
version: "3"
name: fullstack-school-system
services:
  flask:
    container_name: api-server
    restart: always
    build:
      context: .
      dockerfile: api/Dockerfile
    ports:
      - "5000:5000"
    depends_on:
      - postgres
    environment:
      - DATABASE_URL=postgresql://authuright:authuright@postgres:5432/fullstackdb
    networks:
      - fullstack-network
    volumes:
      - ./api:/api

  postgres:
    image: postgres:latest
    container_name: postgres
    restart: always
    environment:
      POSTGRES_DB: fullstackdb
      POSTGRES_USER: authuright
      POSTGRES_PASSWORD: authuright
    ports:
      - "5432:5432"
    networks:
      - fullstack-network

  vue:
    container_name: vue-server
    restart: always
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "8080:8080"
    volumes:
      - ./:/frontend
    stdin_open: true

networks:
  fullstack-network:
    driver: bridge

EOF

# Run Docker-compose to set up the containers
echo "Setting up containers using Docker-compose..."
sudo docker-compose up -d

echo "Setup complete!"
