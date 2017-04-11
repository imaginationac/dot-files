" Disable menu bar, toolbar, scrollbars
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Use console dialogs instead of popups
set guioptions+=c

" Set the spacing between lines
set linespace=2

" GUI font
if has("mac")
	set guifont=Source\ Code\ Pro\ for\ Powerline:h12,Monaco:16
elseif has("unix")
	set guifont=Monofur\ for\ Powerline\ 12,Monofur\ 12,Monospace\ 10
elseif has("win32") || has("win64")
	set guifont=Consolas:h10:cANSI
endif

" Source .gvimrc on write
if has("autocmd")
	augroup gvimrc
		autocmd!
		autocmd BufWritePost $MYGVIMRC source $MYGVIMRC
	augroup END
endif
