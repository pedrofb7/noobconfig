#---------------------------
# Variables
# --------------------------

nvimdir="$HOME/.config/nvim"
tmuxdir="$HOME/.tmux.conf"

#---------------------------
# Creating the symlink
# --------------------------

if [ ! -d $nvimdir ]; then
    ln -s "$(pwd)/nvim" "$nvimdir"
else
    printf "There is already a Neovim config file, what do you want to do?\n\n"
    printf "0.Keep current\n"
    printf "1.Replace (the current configs will be moved elsewhere)\n"
    printf "2.Erase and replace (this will erase the current configs permanently!!)\n\n"
fi

if [ ! -d $nvimdir ]; then
    ln -s "$(pwd)/.tmux.conf" "$tmuxdir"
else
    printf "There is already a Tmux config file, what do you want to do?\n\n"
    printf "0.Keep current\n"
    printf "1.Replace (the current configs will be moved elsewhere)\n"
    printf "2.Erase and replace (this will erase the current configs permanently!!)\n\n"
fi
