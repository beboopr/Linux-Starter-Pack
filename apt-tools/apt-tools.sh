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
    "git"
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
    "nvm"
    "zsh"
    "zsh-autosuggestions"
    # ... Add more packages
)

# Clone GitHub repositories
echo "Cloning GitHub repositories..."
for repo in "${repos[@]}"; do
    git clone https://github.com/Z4nzu/hackingtool.git
    git clone https://github.com/tegal1337/CiLocks
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
    curl -fsSL https://bun.sh/install | bash
done

# Install apt packages
echo "Installing apt packages..."
sudo apt-get update
sudo apt-get install -y "${apt_packages[@]}"

# Add any additional commands here
# ...

echo "All done :)"
