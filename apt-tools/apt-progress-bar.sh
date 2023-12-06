#!/bin/bash

# Install pv if not already available
sudo apt-get install -y pv

# Define variables for total progress and current step
total_progress=100
current_step=1

# Function to clone a repo with progress bar
clone_repo() {
  repo="$1"
  size=$(pv -q -s 1M <(git clone https://github.com/$repo.git))
  update_progress "$size"
}

# Function to install a apt-package with progress bar
install_package() {
  package="$1"
  pv -q -s 1M <(sudo apt-get install -y "$package") &> /dev/null
  update_progress 5 # Assume package installation takes 5% of total progress
}

# Function to update overall progress based on size or step
update_progress() {
  progress_value="$1"
  current_progress=$((current_progress + progress_value * total_progress / 100))
  echo -ne "\r[$(printf '%*s' $current_progress '-')] $current_progress%"
}

# Start with repositories
echo "Cloning GitHub repositories..."
for repo in "${repos[@]}"; do
  clone_repo "$repo" &
done

# Wait for all repo clones to finish
wait

# Install apt packages
echo "Installing apt packages..."
for package in "${apt_packages[@]}"; do
  install_package "$package" &
done

# Wait for all package installations to finish
wait

# Finish up
update_progress 100 # Mark final progress
echo -e "\nAll done!"
