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
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
Bundle 'sjl/gundo.vim'
Bundle 'sjl/splice.vim'
Bundle 'sjl/clam.vim'

" Vim-Scripts.org sources (also hosted on Github)
Bundle 'vim-coffee-script'
Bundle 'surround.vim'
Bundle 'tComment'
Bundle 'jade.vim'
Bundle 'vim-json-bundle'

filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline settings
if has("gui_running")
	if has("unix")
		set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
	elseif has("win32") || has("win64")
		set guifont=Consolas:h10:cANSI
	endif
endif

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
augroup CommandT_augroup
	autocmd!
	autocmd BufWrite * CommandTFlush
augroup END

" Keymappings
" Gundo toggle
nnoremap <F5> :GundoToggle<CR>
" Open vimrc for editing
nnoremap ,v :e ~/.vimrc<CR>

" Source .vimrc on write
augroup vimrc_augroup
	autocmd!
	autocmd BufWritePost ~/.vimrc source ~/.vimrc
	autocmd BufWritePost ~/.vimrc :PowerlineReloadColorscheme
augroup END
