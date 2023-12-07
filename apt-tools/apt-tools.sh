#!/bin/bash

# This script is used to install apt packages and clone GitHub repositories

# Define your GitHub repositories here
repos=(
    "https://github.com/danielmiessler/SecLists.git"
    "https://github.com/carlospolop/PEASS-ng.git"
    # ... Add more repositories
)

# Define your apt installation tools here
apt_packages=(
    "gnome-text-editor"
    "docker-compose"
    "curl"
    "git"
    "htop"
    "neofetch"
    "python3-pip"
    "sqlmap"
    "synaptic"
    "tcpdump"
    "tilix"
    "tmux"
    "vim"
    "zsh"
    # ... Add more packages
)

# Clone GitHub repositories
echo "Cloning GitHub repositories..."
for repo in "${repos[@]}"; do
    git clone https://github.com/Z4nzu/hackingtool.git
    git clone https://github.com/tegal1337/CiLocks
done

# Install apt packages
echo "Installing apt packages..."
sudo apt-get update
sudo apt-get install -y "${apt_packages[@]}"

# Add any additional commands here
# ...

echo "All done :)"
