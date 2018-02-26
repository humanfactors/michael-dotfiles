# _,.-'~'-.,__,.-'~'-.,__,.-'~'-.,__,.-'~'-.,__
# ZSH Configuration

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.sh | zsh
ZSH_THEME="spaceship"

# ZSH Plugins
plugins=(git zsh-autosuggestions colored-man golang zsh-syntax-highlighting colored-man python)

# User configuration
source $ZSH/oh-my-zsh.sh
source $HOME/bin/emacs-helpers
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$HOME/bin

# -------- END OF OHMYZSH CONFIG --------

# Set overall configuration
export TERM=xterm-256color
SAVEHIST=100000

# Global Settings
# export LANGUAGE = "en_AU:en"
export LANG=en_AU.UTF-8
export LC_ALL=en_AU.UTF-8
export EDITOR=vim
export NOTES_DIR="$HOME/Dropbox/Notes"

export ARCHFLAGS="-arch x86_64"
alias say="espeak"


# # Functions and Paths
# source "${HOME}/.skankybin/music.sh"
# source "${HOME}/.skankybin/helpers.sh"

# Auto ls on directory change
# auto-ls () {
# 	emulate -L zsh;
# 	# explicit sexy ls'ing as aliases arent honored in here.
# 	hash gls >/dev/null 2>&1 && CLICOLOR_FORCE=1 gls -aFh --color --group-directories-first || ls
# }
# chpwd_functions=( auto-ls $chpwd_functions )


# _,.-'~'-.,__,.-'~'-.,__,.-'~'-.,__,.-'~'-.,__
# Key Binds and Aliases

alias zshrc="$EDITOR ~/.zshenv"
alias py='python3'
alias whatsmyip="wget -qO- http://ipecho.net/plain ; echo"
alias localip="ip a | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

# _,.-'~'-.,__,.-'~'-.,__,.-'~'-.,__,.-'~'-.,__
# Colored Welcome Message (Optional)
# _,.-'~'-.,__,.-'~'-.,__,.-'~'-.,__,.-'~'-.,__
#RED='\033[0;31m'
#GREEN='\033[0;32m'
#CYAN='\033[0;33m'
#NC='\033[0m'
#echo -e "${GREEN}new note is ${CYAN}nn"
#echo -e "${GREEN}search notes with ${CYAN}ns"


