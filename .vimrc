" Vundle is a plugin manager
" Install Vundle first
" https://github.com/gmarik/vundle#README
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
if has("syntax")
	syntax enable
endif

set laststatus=2
if has("multi_byte_encoding")
	set encoding=utf-8
endif

set number
set background=dark
if has("eval")
	colorscheme badwolf
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global whitespace rules
set tabstop=4
set shiftwidth=4
set softtabstop=4
set hidden

" Symbols for listchars
set listchars=tab:▸\ ,eol:¬
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline settings
source ~/.vim/bundle/powerline/powerline/ext/vim/source_plugin.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-T settings
let g:CommandTMatchWindowAtTop=0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clam settings
let g:clam_winpos = 'belowright'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymappings

" Gundo toggle
nnoremap <F5> :GundoToggle<CR>

" Open vimrc, gvimrc for editing
nnoremap ,v :e $MYVIMRC<CR>
nnoremap ,g :e $MYGVIMRC<CR>

" Toggle showing invisiblies (tabs and line endings)
nnoremap <Leader>w :set list!<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
if has("autocmd")
	" Source .vimrc on write
	augroup vimrc
		autocmd!
		autocmd BufWritePost $MYVIMRC source $MYVIMRC
	augroup END
	" Clean up old bundles and install new ones.
	augroup vundle
		autocmd!
		set verbose=9
		autocmd BufWritePost $MYVIMRC BundleClean!
		autocmd BufWritePost $MYVIMRC BundleInstall
		set verbose=0
		" TODO: Update vundles on the first of the month.
	augroup END
	" Haskell whitespace rules.
	augroup haskell
		autocmd!
		autocmd FileType haskell setlocal ts=4 sts=4 sw=4 expandtab
	augroup END
	" Flush the Command-T path cache.
	augroup CommandT
		autocmd!
		autocmd BufWritePost, * CommandTFlush
	augroup END
	" Set the file type for the extendsion .md to markdown
	augroup markdown
		autocmd!
		autocmd BufNewFile,BufWrite,BufRead, *.md set filetype=markdown
	augroup END
endif
