if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# ln -s /home/michael/Code/dotfiles/bin /home/michael
ln -s /home/michael/Code/dotfiles/.zshenv /home/michael/ &&
ln -s /home/michael/Code/dotfiles/.bashrc /home/michael/ &&
ln -s /home/michael/Code/dotfiles/.zshrc /home/michael/ &&
ln -s /home/michael/Code/dotfiles/.vim /home/michael/ &&
ln -s /home/michael/Code/dotfiles/fonts/ /home/michael/.fonts &&
ln -s /home/michael/Code/dotfiles/.tmux.conf /home/michael/