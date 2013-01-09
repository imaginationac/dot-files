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
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
Bundle 'sjl/gundo.vim'
Bundle 'sjl/clam.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/badwolf'
Bundle 'kien/ctrlp.vim'
Bundle 'wavded/vim-stylus'
" Powerline isn't configured for Vundle yet, require some setup
Bundle 'Lokaltog/powerline'

" Vim-Scripts.org sources (also hosted on Github)
Bundle 'vim-coffee-script'
Bundle 'surround.vim'
Bundle 'tComment'
Bundle 'jade.vim'
Bundle 'vim-json-bundle'

filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
	if has("unix")
		set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10,DejaVu\ Sans\ Mono\ 10,Monospace\ 10
	elseif has("win32") || has("win64")
		set guifont=Consolas:h10:cANSI
	endif
endif

set laststatus=2
set encoding=utf-8

set number
set background=dark
colorscheme badwolf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Whitespace rules
set tabstop=4
set shiftwidth=4
set softtabstop=4
set hidden
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline settings
source ~/.vim/bundle/powerline/powerline/ext/vim/source_plugin.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-T settings
let g:CommandTMatchWindowAtTop=0
if has("autocmd")
	augroup CommandT_augroup
		autocmd!
		autocmd BufWritePost, * CommandTFlush
	augroup END
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clam settings
let g:clam_winpos = 'belowright'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymappings
" Gundo toggle
nnoremap <F5> :GundoToggle<CR>
" Open vimrc for editing
nnoremap ,v :e ~/.vimrc<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype autocommands
" Set .md files as markdown
if has("autocmd")
	augroup markdown
		autocmd!
		autocmd BufNewFile,BufWrite,BufRead, *.md set filetype=markdown
	augroup END
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source .vimrc on write
if has("autocmd")
	augroup vimrc_augroup
		autocmd!
		autocmd BufWritePost ~/.vimrc source ~/.vimrc
		" Remove any
		autocmd BufWritePost ~/.vimrc BundleClean!
		autocmd BufWritePost ~/.vimrc BundleInstall
	augroup END
endif
