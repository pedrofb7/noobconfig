#Copy this int you current .zshrc or .bashrc to apply

#Alias 
alias ls='ls -a --color'

# To make yazi change the Directory when exits
# function made by Harry Dhillon (https://blog.harryy.dev/posts/make-yazi-change-your-directory/)
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}
