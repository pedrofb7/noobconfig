#!/bin/bash

PACKAGES=(
    "nvim"
    "tmux"
    "yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick"
    "gum"
    "nodejs"
)

# Installing the packages
for item in "${PACKAGES[@]}"; do
    #gets the first name of the package
    pack=$(echo $item | awk '{print $1}')

    if ! sudo pacman -Q "$pack" >/dev/null 2>&1; then
        echo "Installing $pack..."

        if sudo pacman -S --noconfirm $item >/dev/null 2>&1; then
            echo "$pack ---installed successfully!"
        else
            echo "Error: Failed to install $pack."
        fi
    else
        echo "$pack ---already installed"
    fi
done
