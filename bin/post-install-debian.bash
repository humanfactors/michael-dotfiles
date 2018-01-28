#! /bin/bash
# Michael's Post Debian Install Script

mkdir ~/tmp/
mkdir ~/Code/


sudo apt-get -y update && apt-get -y upgrade

# Essentials
sudo apt-get -y install git
sudo apt-get -y install curl wget
sudo apt-get -y install emacs vim terminator
sudo apt-get -y install apt install linux-headers-$(uname -r | sed 's/[^-}*-[^-]*-//')
sudo apt-get -y chromium

# Scientific Computing
sudo apt-get -y install texlive
sudo apt-get -y install pandoc pandoc-citeproc pandoc-data
sudo apt-get -y install python2 python-pip
sudo apt-get -y install python3 python3-pip
sudo apt-get -y install r-base
sudo apt-get -y install golang

# Fonts
sudo apt-get -y install ttf-mscorefonts-installer
git clone git clone https://github.com/powerline/fonts.git
cd fonts/
./install.sh
cd ..
rm -rf fonts/
fc-cache -f -v

# Development
sudo apt-get -y install build-essential automake autoconf gnu-standards
sudo apt-get -y install pwgen htop 


# Gnome Specific Settings
apt-get -y install arc-theme
sudo apt install papirus-icon-theme


# Frameworks
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Zsh Configurations
zsh
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d


# Firefox Install
# Download latest firefox
# sudo apt remove firefox-esr
# tar xf firefox-58.0.tar.bz2
# sudo mv firefox /opt/firefox
# sudo ln -s /opt/firefox/firefox /usr/bin/firefox
# sudo gedit /usr/share/applications/firefox.desktop