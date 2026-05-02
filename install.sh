#!/bin/bash


PACKAGES=(
    "nvim"
    "tmux"
    "yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick"
    "gum"
)

# Installing the packages
for item in "${PACKAGES[@]}"; do
	#gets the first name of the package 
    cmd=$(echo $item | awk '{print $1}')

    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "Installing $cmd..."
        
        if sudo pacman -S --noconfirm $item >/dev/null 2>&1; then
            echo "$cmd ---installed successfully!"
        else
            echo "Error: Failed to install $cmd."
        fi
    else
        echo "$cmd ---already installed"
    fi
done
