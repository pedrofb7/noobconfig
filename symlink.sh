#!/bin/bash

#---------------------------
# Variables
#--------------------------
NVIM_TARGET="$HOME/.config/nvim"
TMUX_TARGET="$HOME/.tmux.conf"
YAZI_TARGET="$HOME/.config/yazi"
DOT_DIR=$(pwd)

#---------------------------
# Functions
#--------------------------

# Header Display
header() {
    gum style \
        --foreground 212 --border-foreground 212 --border double \
        --align center --width 50 --margin "1 2" --padding "2 4" \
        "NOOBCONFIG" "v2.0 - dotfiles installer"
}

manage_config() {
    local src="$1"	#the new config
    local target="$2"	#the diretory
    local name="$3"	#simple name


    gum style --foreground 86 "Checking configuration for: $name"

    if [ ! -e "$target" ]; then
        echo "Creating initial symlink..."
        ln -s "$src" "$target"
        gum style --foreground 46 "✓ $name linked successfully."
    else

        ACTION=$(gum choose --header "Existing config found for $name. What to do next?" \
            "Keep current" \
            "Replace (Backup old)" \
            "Erase and Replace")

        case "$ACTION" in
            "Keep current")
                echo "Skipping $name."
		;;
            "Replace (Backup old)")
                mv "$target" "${target}.bak"
                ln -s "$src" "$target"
                gum style --foreground 46 "✓ $name backed up to ${target}.bak and relinked."
                ;;
            "Erase and Replace")
                if gum confirm "DANGER: This will permanently delete your old $name config. Proceed?"; then
                    rm -rf "$target"
                    ln -s "$src" "$target"
                    gum style --foreground 196 "🗑️ $name erased and replaced."
                else
                    echo "Action cancelled."
                fi
                ;;
        esac
    fi
    printf "\n"
}

#---------------------------------------
# Execution
#---------------------------------------

#Begin
clear
header

#Configuring
manage_config "$DOT_DIR/.config/nvim" "$NVIM_TARGET" "Neovim"
manage_config "$DOT_DIR/.config/.tmux.conf" "$TMUX_TARGET" "Tmux"
manage_config "$DOT_DIR/.config/yazi" "$YAZI_TARGET" "Yazi"

gum style --faint "Installation complete. Happy hacking!"
