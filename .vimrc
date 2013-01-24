" Vundle {{{
" Vundle is a plugin manager
" Install Vundle first
" https://github.com/gmarik/vundle#README
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Github sources
let s:GitHubBundles = []
Bundle 'gmarik/vundle'
" Command-T requires additional setup. See 'command-t.txt'
Bundle 'wincent/Command-T'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'sjl/gundo.vim'
Bundle 'sjl/clam.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/badwolf'
Bundle 'kien/ctrlp.vim'
Bundle 'wavded/vim-stylus'
" Powerline requires specifying the runtimepath.
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tcomment_vim'

" Vim-Scripts.org sources (also hosted on Github)
Bundle 'jade.vim'
Bundle 'vim-json-bundle'

filetype plugin indent on
" }}}
" Common visual settings. {{{
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

" Vertically split windows to the right.
if has("vertsplit")
	set splitright
endif
" }}}
" Global whitespace rules {{{
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set hidden

" Symbols for listchars
set listchars=tab:▸\ ,eol:¬
" }}}
" Search options {{{
set ignorecase
set smartcase
if has('extra_search')
	set incsearch
endif
" }}}
" Plugin specific settings {{{
" Command-T settings
let g:CommandTMatchWindowAtTop=0

" Clam settings
let g:clam_winpos = 'belowright'
" }}}
" Keymappings {{{
" Leader
let mapleader = ","

" Gundo toggle
nnoremap <F5> :GundoToggle<CR>

" Open vimrc, gvimrc for editing
nnoremap <Leader>v :vsplit $MYVIMRC<CR>
nnoremap <Leader>g :vsplit $MYGVIMRC<CR>

" Toggle showing invisiblies (tabs and line endings)
nnoremap <Leader>w :set list!<CR>

" Toggle spell-check
nnoremap <Leader>s :set spell!<CR>
" }}}
" Autocommands {{{
if has("autocmd")
	" Clean up old bundles and install new ones.
	augroup vundle
		autocmd!
		autocmd BufWritePost $MYVIMRC BundleClean!
		autocmd BufWritePost $MYVIMRC BundleInstall
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
	augroup zsh-theme
		autocmd!
		autocmd BufNewFile,BufWrite,BufRead, *.zsh-theme set filetype=zsh
	augroup END
	" Folding for vimscript files
	augroup filetype_vim
		autocmd!
		autocmd FileType vim setlocal foldmethod=marker
	augroup END
	" Source .vimrc on write
	augroup vimrc
		autocmd!
		autocmd BufWritePost $MYVIMRC source $MYVIMRC
	augroup END
endif
" }}}
