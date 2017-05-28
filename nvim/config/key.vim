" Keymappings {{{
" Leader
let g:mapleader = ','

" Write the buffer to file in normal mode.
nnoremap <C-s> :update<CR>

" Open vimrc for editing
nnoremap <Leader>v :e $MYVIMRC<CR>

" Toggle showing invisibles (tabs and line endings)
nnoremap <Leader>w :set list!<CR>

" Toggle spell-check
nnoremap <Leader>s :set spell!<CR>

" Toggle highlight search
nnoremap <Leader>h :set hlsearch!<CR>

" Workaround for numbers.vim. Exiting insert mode with <C-c> does not toggle
" relaitve numbers back on.
inoremap <C-c> <Esc>
