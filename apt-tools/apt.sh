#!/bin/bash

# This script is used to install apt packages and clone GitHub repositories

# Define your GitHub repositories here
repos=(
    "https://github.com/danielmiessler/SecLists.git"
    # ... Add more repositories
)

# Define your apt installation tools here
apt_packages=(
    "git"
    "curl"
    "vim"
    "tilix"
    "zsh"
    "tmux"
    "python3-pip"

    # ... Add more packages
)

# Clone GitHub repositories
echo "Cloning GitHub repositories..."
for repo in "${repos[@]}"; do
    git clone https://github.com/$repo.git
done

# Install apt packages
echo "Installing apt packages..."
sudo apt-get update
sudo apt-get install -y "${apt_packages[@]}"

# Add any additional commands here
# ...

echo "All done :)"
