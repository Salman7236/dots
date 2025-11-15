#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
# Colorized prompt with user@host and directory
#export PS1="\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]\$ "

if [ -f $HOME/.bash_aliases ]; then
  . $HOME/.bash_aliases
fi

############################

# auto exec
fastfetch

### Onefetch ###
# git repository greeter
last_repository=
check_directory_for_new_repository() {
  current_repository=$(git rev-parse --show-toplevel 2>/dev/null)

  if [ "$current_repository" ] &&
    [ "$current_repository" != "$last_repository" ]; then
    onefetch
  fi
  last_repository=$current_repository
}
cd() {
  builtin cd "$@"
  check_directory_for_new_repository
}

# optional, greet also when opening shell directly in repository directory
# adds time to startup
check_directory_for_new_repository
###############

# Zoxide
eval "$(zoxide init bash)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# yazi change cwd when exiting
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}
