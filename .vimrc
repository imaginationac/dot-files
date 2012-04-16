" Vundle settings START
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Github sources
Bundle 'gmarik/vundle'
" Command-T require outside configuration, read the help
Bundle 'wincent/Command-T'
Bundle 'tpope/vim-fugitive'

" Vim-Scripts.org
Bundle 'molokai'
Bundle 'vim-coffee-script'
Bundle 'surround.vim'
Bundle 'tComment'

filetype plugin indent on
" Vundle settings END
set number
colorscheme molokai
set tabstop=4
set shiftwidth=4
set softtabstop=4
set hidden

" Command-T settings
let g:CommandTMatchWindowAtTop=1
