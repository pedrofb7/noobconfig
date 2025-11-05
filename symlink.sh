#---------------------------
# Variables
#--------------------------

nvimdir="$HOME/.config/nvim"
tmuxdir="$HOME/.tmux.conf"

#---------------------------
# Functions
#--------------------------
what_to_do() {

    printf "There is already a Neovim config file, what do you want to do?\n\n"
    printf "0.Keep current\n"
    printf "1.Replace (the current configs will be moved elsewhere)\n"
    printf "2.Erase and replace (this will erase the current configs permanently!!)\n\n"

    option=10

    while [ $option -ne 0 ] && [ $option -ne 1 ] && [ $option -ne 2 ]; do

        read option

        case $option in
        0) echo "ok then" ;;
        1) echo "replacing" ;;
        2) echo "erasing and replacing" ;;
        *) echo "invalid option, seletc 0, 1, or 2:\n" ;;
        esac
    done
    printf "\n"
}

#---------------------------------------
# Creating the symlink
#---------------------------------------

#-------------- Neovim -----------------
if [ ! -d $nvimdir ]; then
    ln -s "$(pwd)/nvim" "$nvimdir"
else
    what_to_do
fi

#------------ Tmux --------------------
if [ ! -d $nvimdir ]; then
    ln -s "$(pwd)/.tmux.conf" "$tmuxdir"
else
    what_to_do
fi
