""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle is a plugin manager
" Install Vundle first
" https://github.com/gmarik/vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Github sources
Bundle 'gmarik/vundle'
" Command-T requires additional setup
Bundle 'wincent/Command-T'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
Bundle 'sjl/gundo.vim'

" Vim-Scripts.org sources (also hosted on Github)
Bundle 'vim-coffee-script'
Bundle 'surround.vim'
Bundle 'tComment'
Bundle 'jade.vim'

filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline 
" set statusline=%f\ %y%w%m%f%h%L
" Powerline settings
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
let g:Powerline_symbols = 'fancy'
set laststatus=2
set encoding=utf-8

set number
colorscheme molokai
set tabstop=4
set shiftwidth=4
set softtabstop=4
set hidden

" Command-T settings
let g:CommandTMatchWindowAtTop=1
autocmd BufWrite * CommandTFlush

" Source .vimrc on write
autocmd BufWritePost ~/.vimrc source ~/.vimrc
