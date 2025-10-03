#!/bin/bash

#---------------------------
# Variables
# --------------------------

nvimdir="$HOME/.config/nvim"
tmuxdir="$HOME/.tmux.conf"

#---------------------------
# Creating the symlink
# --------------------------

ln -s "$(pwd)/nvim" $nvimdir
ln -s "$(pwd)/.tmux.conf" $tmuxdir

tmux source-file $tmuxdir
