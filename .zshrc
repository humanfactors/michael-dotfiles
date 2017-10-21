# _,.-'~'-.,__,.-'~'-.,__,.-'~'-.,__,.-'~'-.,__
# ZSH Configuration

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.sh | zsh
ZSH_THEME="spaceship"

# ZSH Plugins
case `uname` in
  Darwin)
    # MacOS Config
		plugins=(zsh-autosuggestions git osx colored-man colorize brew pip python command-not-found)
  ;;
  Linux)
    # Linux Config
		plugins=(git zsh-autosuggestions colored-man golang zsh-syntax-highlighting emacs)
  ;;
esac

# User configuration
source $ZSH/oh-my-zsh.sh
source "/home/michael/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$HOME/bin

# -------- END OF OHMYZSH CONFIG --------

# Set overall configuration
export TERM=xterm-256color
SAVEHIST=100000

# Global Settings
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
auto-ls () {
	emulate -L zsh;
	# explicit sexy ls'ing as aliases arent honored in here.
	hash gls >/dev/null 2>&1 && CLICOLOR_FORCE=1 gls -aFh --color --group-directories-first || ls
}
chpwd_functions=( auto-ls $chpwd_functions )


# _,.-'~'-.,__,.-'~'-.,__,.-'~'-.,__,.-'~'-.,__
# Key Binds and Aliases

alias zshrc="$EDITOR ~/.zshrc"
alias py='python3'
alias whatsmyip="wget -qO- http://ipecho.net/plain ; echo"
# alias notes="cd /Users/Michael/Dropbox/Notes"
# alias phd="cd ~/phd/"

# _,.-'~'-.,__,.-'~'-.,__,.-'~'-.,__,.-'~'-.,__
# Colored Welcome Message (Optional)
# _,.-'~'-.,__,.-'~'-.,__,.-'~'-.,__,.-'~'-.,__
#RED='\033[0;31m'
#GREEN='\033[0;32m'
#CYAN='\033[0;33m'
#NC='\033[0m'
#echo -e "${GREEN}new note is ${CYAN}nn"
#echo -e "${GREEN}search notes with ${CYAN}ns"


# Remove annoying highlighting
LS_COLORS="rs=0:di=01;34:ln=04;33:mh=00:pi=04;33:so=01;35:do=01;35:bd=04;33;01:cd=04;33;01:or=04;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;04:ow=34;04:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"
export LS_COLORS
alias uu='sudo apt-get update && sudo apt-get upgrade'
