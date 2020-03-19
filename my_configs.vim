set number relativenumber

" Don't allow for arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" Better up/down navigation
nnoremap j gj
nnoremap k gk
" Remap esc key in insert mode
inoremap jk <Esc>
inoremap kj <Esc>
" Bind semi-colon to colon
nnoremap ; :

" NERDTree toggle with CTRL+n
map <C-n> :NERDTreeToggle<CR>s

" Open NERDTree if no file specified when opening vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if NERDTree only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
