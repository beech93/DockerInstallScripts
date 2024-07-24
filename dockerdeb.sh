#!/bin/sh

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
sudo curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo curl -L https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose

sudo usermod -aG docker $USER

echo
echo "Docker & Docker Compose successfully installed. Please log out & log back in to use without sudo."
echo