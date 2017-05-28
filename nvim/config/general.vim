set number


" Set foldlevel to all closed by default.
set foldlevelstart=0

" Don't show the mode on the last line.
set noshowmode

" Lines to show above and below cursor
set scrolloff=1

" Don't break in middle of words when wrapping.
set linebreak

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

" }}}

colorscheme badwolf
