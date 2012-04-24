" Disable menu bar, toolbar, scrollbars
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Use console dialogs instead of popups
set guioptions+=c

" Source .gvimrc on write
autocmd BufWritePost ~/.gvimrc source ~/.gvimrc
