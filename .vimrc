set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'JCLiang/vim-cscope-utils'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'benmills/vimux'
"Plugin 'gmarik/vundle'
"Plugin 'godlygeek/tabular'
Plugin 'L9'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'gabrielelana/vim-markdown'

Plugin 'vim-scripts/FuzzyFinder'
Plugin 'bling/vim-airline'
"Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-sleuth'
"Plugin 'tpope/vim-commentary'
"Plugin 'scrooloose/nerdtree'
" Plugin 'tpope/vim-projectionist'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax enable

set autoread
set backspace=2
set backup
set browsedir=buffer
