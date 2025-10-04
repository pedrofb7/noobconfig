#!/bin/bash

#Sync
yes | sudo pacman -Syu

# Installing nvim
if [ ! -f $(which nvim) ]; then
    echo "Neovim ---installing"
    yes | sudo pacman -S -y nvim >/dev/null 2>&1

    if [ $? -eq 0 ]; then
        echo "Neovim ---installed successfully!"
    fi
else
    echo "Neovim ---already installed"
fi

# Installing tmux
if [ ! -f $(which tmux) ]; then
    echo "Tmux ---installing"
    yes | sudo pacman -S -y tmux >/dev/null 2>&1

    if [ $? -eq 0 ]; then
        echo "Tmux ---installed successfully!"
    fi
else
    echo "Tmux ---already installed"
fi

# Installing yazi
if [ ! -f $(which yazi) ]; then
    echo "Yazi ---installing"
    yes | sudo pacman -S -y yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick >/dev/null 2>&1

    if [ $? -eq 0 ]; then
        echo "Yazi ---installed successfully!"
    fi
else
    echo "Yazi ---already installed"
fi
