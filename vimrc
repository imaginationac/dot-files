" Vundle {{{
" Vundle is a plugin manager
" Install Vundle first
" https://github.com/gmarik/vundle#README
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Github sources
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Raimondi/delimitMate'
Bundle 'Valloric/YouCompleteMe'
Bundle 'aaronbieber/quicktask'
Bundle 'altercation/vim-colors-solarized'
Bundle 'imaginationac/html.vim'
Bundle 'imaginationac/jade.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'mihaifm/vimpanel'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/badwolf'
Bundle 'sjl/clam.vim'
Bundle 'sjl/gundo.vim'
Bundle 'slim-template/vim-slim'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'vim-json-bundle'
Bundle 'wavded/vim-stylus'
Bundle 'wincent/Command-T'

filetype plugin indent on
" }}}
" Functions {{{

" Get the current time.
" Returns: one of the following values
"	NUMBER: 0
"	STRING: current time in 24-hour format (%H:%M)
function! CurrentTime()
	if !exists("*strftime")
		echom "strftime is not available on your system."
		return 0 
	endif
	return strftime("%H")
endfunction

" Returns weather or not it is day time (between 6:00 AM and 6:00 PM)
" Returns: 
"	NUMBER: 0 if false, 1 if true.
function! IsDayTime()
	let current_time = str2nr(CurrentTime())
	let day_start = 6
	let day_end = 18
	return (current_time >= day_start) && (current_time <= day_end)
endfunction

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

if IsDayTime()
	set background=light
else
	set background=dark
endif

if has("eval")
	colorscheme solarized
endif

" Vertically split windows to the right.
if has("vertsplit")
	set splitright
endif

" Set foldlevel to all closed by default.
set foldlevelstart=0

" Don't show the mode on the last line.
set noshowmode

" Lines to show above and below cursor
set scrolloff=4
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
	set hlsearch
endif
" }}}
" Editing settings {{{
" Sane backspacing in insert mode
set backspace=2

" Store all swap files in a common directory, out of the way.
if !isdirectory($HOME . "/tmp")
	if exists("*mkdir")
		execute mkdir($HOME . "/tmp")
	else
		echom "Cannot find the mkdir command on your system."
	endif
endif
set directory=$HOME/tmp

" }}}
" Plugin specific settings {{{
" Command-T
let g:CommandTMatchWindowAtTop=0
let g:CommandTMatchWindowReverse=1

" Clam
let g:clam_winpos = 'belowright'

" Powerline
set rtp+=/home/dorian/.local/lib/python2.7/site-packages/powerline/bindings/vim
" }}}
" Keymappings {{{
" Leader
let mapleader = ","

" Gundo toggle
nnoremap <F5> :GundoToggle<CR>

" Open vimrc, gvimrc for editing
nnoremap <Leader>v :vsplit $MYVIMRC<CR>
nnoremap <Leader>g :vsplit $MYGVIMRC<CR>

" Toggle showing invisibles (tabs and line endings)
nnoremap <Leader>w :set list!<CR>

" Toggle spell-check
nnoremap <Leader>s :set spell!<CR>

" Toggle highlight search
nnoremap <Leader>h :set hlsearch!<CR>

" Command-T file list
nnoremap <Leader>p :CommandT<CR>

" Save the current session and exit
nnoremap <F2> :mksession! $HOME/.lastvimsession<CR>:qa!<CR>

" }}}
" Autocommands {{{
if has("autocmd")
	" Clean up old bundles and install new ones.
	augroup vundle
		autocmd!
		autocmd BufWritePost $MYVIMRC BundleClean!
		autocmd BufWritePost $MYVIMRC BundleInstall
	augroup END
	" Flush the Command-T path cache.
	augroup CommandT
		autocmd!
		autocmd BufWritePost, * CommandTFlush
	augroup END
	" Set the file type for the extension .md to markdown
	augroup markdown
		autocmd!
		autocmd BufNewFile,BufWrite,BufRead, *.md setlocal filetype=markdown
		autocmd FileType markdown setlocal textwidth=80
	augroup END
	augroup zsh-theme
		autocmd!
		autocmd BufNewFile,BufWrite,BufRead, *.zsh-theme setlocal filetype=zsh
	augroup END
	augroup filetype_coffee
		autocmd!
		autocmd FileType coffee setlocal foldmethod=indent
	augroup END
	" Don't fold git diffs.
	augroup filetype_git
		autocmd!
		autocmd FileType git setlocal foldmethod=manual
	augroup END
	augroup filetype_jade
		autocmd!
		autocmd FileType jade setlocal commentstring=//%s
		autocmd FileType jade setlocal foldmethod=indent
	augroup END
	augroup filetype_sass
		autocmd!
		autocmd FileType sass setlocal softtabstop=2 tabstop=2 shiftwidth=2 expandtab
		autocmd FileType sass setlocal foldmethod=indent
	augroup END
	" Don't expand tabs to space in Slim.
	augroup filetype_slim
		autocmd!
		autocmd FileType slim setlocal noexpandtab
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
