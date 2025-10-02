#!/bin/bash

#---------------------------
# Variables
# --------------------------

nvimdir="$HOME/.config/nvim"

#---------------------------
# Creating the symlink
# --------------------------

ln -s $HOME/noobconfig/nvim/ $nvimdir
