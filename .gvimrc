" Disable menu bar, toolbar, scrollbars
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Use console dialogs instead of popups
set guioptions+=c

" GUI font
if has("gui_running")
	if has("unix")
		set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10,DejaVu\ Sans\ Mono\ 10,Monospace\ 10
	elseif has("win32") || has("win64")
		set guifont=Consolas:h10:cANSI
	endif
endif

" Source .gvimrc on write
if has("autocmd")
	augroup gvimrc
		autocmd!
		autocmd BufWritePost $MYGVIMRC source $MYGVIMRC
	augroup END
endif
