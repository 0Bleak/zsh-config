if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8
export EDITOR='nano'
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  z
  sudo
  docker
  npm
  vscode
  fzf
)

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt APPEND_HISTORY

autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias rm='rm -i'
alias r='ranger'
alias e='nano'
alias cls='clear'

alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gc='git commit'
alias gb='git branch'
alias gch='git checkout'
alias gpu='git pull'
alias gcl='git clone'
alias i='whoami && pwd'

alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dps='docker ps'
alias di='docker images'
alias dr='docker run'
alias dbash='docker exec -it'

function myip() {
  echo "Fetching IP addresses..."
  for iface in $(ifconfig | cut -d' ' -f1 | tr ':' '\n' | awk NF); do
    ifconfig $iface | grep 'inet ' | awk -v iface=$iface '{print iface " (IPv4): " $2}'
    ifconfig $iface | grep 'inet6 ' | awk -v iface=$iface '{print iface " (IPv6): " $2}'
  done
}

function mkcd() {
  mkdir -p "$1" && cd "$1"
}

function extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"   ;;
      *.tar.gz)    tar xzf "$1"   ;;
      *.bz2)       bunzip2 "$1"   ;;
      *.rar)       unrar e "$1"   ;;
      *.gz)        gunzip "$1"    ;;
      *.tar)       tar xf "$1"    ;;
      *.tbz2)      tar xjf "$1"   ;;
      *.tgz)       tar xzf "$1"   ;;
      *.zip)       unzip "$1"     ;;
      *.Z)         uncompress "$1";;
      *.7z)        7z x "$1"      ;;
      *)           echo "Cannot extract '$1' - unknown format." ;;
    esac
  else
    echo "$1 is not a valid file"
  fi
}

function timer() {
  SECONDS=0
  "$@"
  duration=$SECONDS
  echo "Execution time: $(($duration / 60)) minutes and $(($duration % 60)) seconds."
}

function gitinfo() {
  echo "Branch: $(git rev-parse --abbrev-ref HEAD)"
  echo "Last commit: $(git log -1 --pretty=%B)"
  echo "Author: $(git log -1 --pretty=%an)"
}

function searchcode() {
  grep -rnw "$1" -e "$2"
}

function devserver() {
  local port=${1:-8000}
  echo "Starting a Python HTTP server on port $port"
  python3 -m http.server $port
}

function killport() {
  lsof -i :$1 | awk 'NR!=1 {print $2}' | xargs kill -9
  echo "Killed processes running on port $1"
}


function randompass() {
  openssl rand -base64 ${1:-16}
}

function filesize() {
  if [ -f "$1" ]; then
    stat --printf="%s bytes\n" "$1"
  else
    echo "$1 is not a valid file"
  fi
}
source $ZSH/oh-my-zsh.sh

source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
POWERLEVEL9K_SHORTEN_DIR_LENGTH=0
POWERLEVEL9K_DIR_ABSOLUTE_PATH=true
echo -ne '\e[6 q' 

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 


export FZF_BASE="$HOME/.fzf"
[ -f "$FZF_BASE/bin/fzf" ] && source "$FZF_BASE/shell/completion.zsh" && source "$FZF_BASE/shell/key-bindings.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

PROMPT='%F{blue}%n@%m%f %F{green}%~%f %# '
export PATH=$PATH:/home/bleak/go/bin
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

export TERM="xterm-256color"
export COLORTERM="truecolor"
