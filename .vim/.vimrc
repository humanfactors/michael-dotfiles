set nocompatible

let mapleader=" "
colorscheme Tomorrow-Night
filetype on
syntax on

set autoread
set backspace=2
set browsedir=buffer

" Mimic Emacs Line Editing in Insert Mode Only
inoremap <C-A> <Home>
inoremap <C-B> <Left>
inoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <C-K> <Esc>lDa
inoremap <C-U> <Esc>d0xi
inoremap <C-Y> <Esc>Pa
inoremap <C-X><C-S> <Esc>:w<CR>a

" Mimic Emacs Line Editing in Insert Mode Only
nnoremap <C-A> <Home>
nnoremap <C-E> <End>
nnoremap <C-K> <Esc>lDa
nnoremap <C-U> <Esc>d0xi
nnoremap <C-Y> <Esc>Pa
nnoremap <C-X><C-S> <Esc>:w<CR>a