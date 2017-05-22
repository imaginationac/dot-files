" Dein {{{
" Dein is a plugin manager.
" https://github.com/Shougo/dein.vim
if &compatible
	set nocompatible
endif
let deinPath = "~/.vim/dein/repos/github.com/dein.vim"
let pluginBasePath = "~/.vim/dein"
let githubSources = [
			\ 'Shougo/dein.vim',
			\ 'Raimondi/delimitMate',
			\ 'Valloric/YouCompleteMe',
			\ 'aaronbieber/vim-quicktask',
			\ 'altercation/vim-colors-solarized',
			\ 'easymotion/vim-easymotion',
			\ 'imaginationac/html.vim',
			\ 'imaginationac/jade.vim',
			\ 'kchmck/vim-coffee-script',
			\ 'kien/ctrlp.vim',
			\ 'mattn/emmet-vim',
			\ 'msanders/snipmate.vim',
			\ 'myusuf3/numbers.vim',
			\ 'scrooloose/syntastic',
			\ 'sjl/badwolf',
			\ 'sjl/gundo.vim',
			\ 'slim-template/vim-slim',
			\ 'tmux-plugins/vim-tmux',
			\ 'tomtom/quickfixsigns_vim',
			\ 'tomtom/tcomment_vim',
			\ 'tpope/vim-fugitive',
			\ 'tpope/vim-surround',
			\ 'vim-airline/vim-airline',
			\ 'vim-scripts/vim-json-bundle',
			\ 'wavded/vim-stylus',
			\ ]

set runtimepath+=~/.vim/dein/repos/github.com/dein.vim
if dein#load_state(pluginBasePath)
	call dein#begin(pluginBasePath)
	for item in githubSources
		call dein#add(item)
	endfor
	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on

if has("syntax")
	syntax enable
endif
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

" Returns whether or not it is day time (between 6:00 AM and 6:00 PM)
" Returns: 
"	NUMBER: 0 if false, 1 if true.
function! IsDayTime()
	let current_time = str2nr(CurrentTime())
	let day_start = 6
	let day_end = 18
	return (current_time >= day_start) && (current_time <= day_end)
endfunction

" Sets the background based on the time of day.
" TODO: Set the background based on an optional argument.
function! SetBackground()
	if IsDayTime()
		set background=light
	else
		set background=dark
	endif
endfunction

" }}}
" Common visual settings. {{{

set laststatus=2
if has("multi_byte_encoding")
	set encoding=utf-8
endif

set number

if has('gui_running')
	call SetBackground()
endif

if has('gui_running')
	colorscheme solarized
else
	silent! colorscheme badwolf
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

" Don't break in middle of words when wrapping.
set linebreak
" }}}
" Global whitespace rules {{{
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set hidden

" Symbols for listchars
set listchars=tab:\|\ ,eol:¬,trail:․
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
" Ctrl-P
" Show dot files.
if exists('g:loaded_ctrlp')
	let g:ctrlp_show_hidden = 1
	let g:ctrlp_custom_ignore = '\v[\/]\.(sass-cache|git|hg|svn)$'
endif

" Powerline if compiled with python or is NOT neovim; otherwise use Airline
if !has("nvim") && ( has("python") || has("python3") )
	python from powerline.vim import setup as powerline_setup
	python powerline_setup()
	python del powerline_setup
else

endif
" }}}
" Keymappings {{{
" Leader
let mapleader = ","

" Write the buffer to file in normal mode.
nnoremap <C-s> :w<CR>

" Gundo toggle
nnoremap <F5> :GundoToggle<CR>

" Open vimrc, gvimrc for editing
nnoremap <Leader>v :e $MYVIMRC<CR>
nnoremap <Leader>g :e $MYGVIMRC<CR>

" Toggle showing invisibles (tabs and line endings)
nnoremap <Leader>w :set list!<CR>

" Toggle spell-check
nnoremap <Leader>s :set spell!<CR>

" Toggle highlight search
nnoremap <Leader>h :set hlsearch!<CR>

" Save the current session and exit
nnoremap <F2> :mksession! $HOME/.lastvimsession<CR>:qa!<CR>

" WORKAROUND for number.vim. Exiting insert mode with <C-c> does not toggle
" relaitve numbers back on.
inoremap <C-c> <Esc>

" }}}
" Autocommands {{{
if has("autocmd")
	" Clean up old bundles and install new ones.
	augroup markdown
		autocmd!
		" Set the file type for the extension .md to markdown
		autocmd BufNewFile,BufWrite,BufRead, *.md setlocal filetype=markdown
		" Set the textwidth to 80 characters in markdown files.
		autocmd FileType markdown setlocal textwidth=80
		" Normal mode mapping for checking empty link references.
		autocmd FileType markdown nnoremap <buffer> <F3> /()<CR>
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
	augroup indent
		autocmd!
		autocmd BufWritePre * :normal magg=G`a
	augroup END
endif
" }}}
