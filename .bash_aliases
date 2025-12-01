### pacman ###
alias S='sudo pacman -S --needed'
alias Syu='sudo pacman -Syu --needed'
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"
alias yeet='yay -Rns'
# alias search='sudo pacman -Qs'
##############

### configs ###
alias aliases='nvim ~/.bash_aliases'
alias hc='nvim ~/.config/hypr/hyprland.conf'
alias kc='nvim ~/.config/kitty/kitty.conf'
alias ilua='nvim ~/.config/nvim/init.lua'
alias wilua='v /Windows/Users/muham/AppData/Local/nvim/init.lua'
alias dc='nvim ~/.config/docker/docker-compose.yml'
alias mpvconf='v ~/.config/mpv/mpv.conf'

# dotfiles git workflow #
alias dots='/usr/bin/git --git-dir=$HOME/dots/ --work-tree=$HOME'
###############

### others ###
alias fr='sudo $(history -p !!)'
alias :q="echo 'You ain'\''t editing a file, nigga.'"
#alias :wq=':q'
alias :wq="echo 'There ain'\''t nothin'' to save, cuh.'"
alias :x="echo 'This ain'\''t Vim, bro.'"
alias :qa="echo 'Quitting all what? You in Bash.'"
alias :w="echo 'Write where? There ain'\''t no buffer here.'"
alias ZZ="echo 'Trying to be slick with ZZ? Nah.'"
alias vote='aur-auto-vote -n Salman7236'
#alias v='nvim'
alias update-grub="sudo grub-mkconfig -o '/boot/grub/grub.cfg'"
alias ff="fastfetch"
alias ssh256='TERM=xterm-256color ssh'
alias v520='ssh salman@v520.local'
alias s='kitten ssh salman@v520.local'
alias snap='sudo timeshift --create --comments'
alias shh='systemctl sleep'
alias rs='rsync -chavzP --stats'
alias reset-network='sudo systemctl restart NetworkManager && sudo systemctl restart systemd-resolved'
alias e='exit'
alias tl='sudo timeshift --list'
alias cpu='auto-cpufreq --stats'
##############

### Docker ###
alias docker-update='sudo docker-compose -f ~/.config/docker/docker-compose.yml pull'
alias docker-up='sudo docker-compose -f ~/.config/docker/docker-compose.yml up -d'
alias docker-down='sudo docker-compose -f ~/.config/docker/docker-compose.yml down'
###################

### Directories ###
###################

###################
alias c='clear && fastfetch' # quick clear + fetch
alias ..='cd ..'
alias ...='cd ../..'
# alias -='cd -' # return to last dir

# eza ls aliases

alias ls='eza --color=always --group-directories-first --icons'
alias ll='eza -la --icons --octal-permissions --group-directories-first'
alias l='eza -blGF --header --git --color=always --group-directories-first --icons'
alias llm='eza -lbGd --header --git --sort=modified --color=always --group-directories-first --icons'
alias la='eza --long --all --group --group-directories-first'
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --color=always --group-directories-first --icons'

alias lS='eza -1 --color=always --group-directories-first --icons'
alias lt='eza --tree --level=2 --color=always --group-directories-first --icons'
alias l.="eza -a | grep -E '^\.'"

### Functions ###

# v = nvim
v() {
  nvim "$@"
}

sudo() {
  if [ "$1" = "v" ]; then
    shift
    command sudo nvim "$@"
  else
    command sudo "$@"
  fi
}

### timing
profile_bashrc() {
  echo "=== Bashrc Profile ==="

  profile() {
    local desc="$1"
    local cmd="$2"
    echo -n "$desc: "
    { time eval "$cmd"; } 2>&1 | grep real
  }

  # 1. Aliases & PS1
  profile "Aliases & PS1" "alias ls='ls --color=auto'; alias grep='grep --color=auto'; PS1='[\u@\h \W]\$ '"

  # 2. Sourcing bash_aliases
  profile "Sourcing ~/.bash_aliases" "[ -f \$HOME/.bash_aliases ] && . \$HOME/.bash_aliases"

  # 3. fastfetch
  profile "fastfetch" "fastfetch"

  # 4. git rev-parse (simulate not in repo)
  profile "git rev-parse" "git rev-parse --show-toplevel 2>/dev/null || true"

  # 5. onefetch (simulate not in repo)
  profile "onefetch" "onefetch 2>/dev/null || true"

  # 6. zoxide
  profile "zoxide init" "eval \"\$(zoxide init bash)\""

  # 7. fzf
  profile "fzf init" "eval \"\$(fzf --bash)\""

  # 8. PATH export
  profile "PATH export" "export PATH=\$HOME/.local/bin:\$PATH"

  # 9. fnm
  profile "fnm init" "eval \"\$(fnm env --use-on-cd --shell bash)\""

  # 10. yazi helper (without opening full UI)
  tmpfile=$(mktemp)
  profile "yazi helper" "yazi --cwd-file='$tmpfile' --non-interactive >/dev/null 2>&1; rm -f '$tmpfile'"

  echo "=== Done ==="
}
