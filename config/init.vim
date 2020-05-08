set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

if has('nvim')
  augroup vimrc_term
    autocmd!
    autocmd WinEnter term://* nohlsearch
    autocmd WinEnter term://* startinsert

    autocmd TermOpen * tnoremap <buffer> <C-h> <C-\><C-n><C-w>h
    autocmd TermOpen * tnoremap <buffer> <C-j> <C-\><C-n><C-w>j
    autocmd TermOpen * tnoremap <buffer> <C-k> <C-\><C-n><C-w>k
    autocmd TermOpen * tnoremap <buffer> <C-l> <C-\><C-n><C-w>l
  augroup END
endif

" using https://github.com/junegunn/fzf.vim & fzf installed.
" makes <C-j> and <C-k> work in FZF in neovim terminal
augroup vimrc_term_fzf
  autocmd!
  " Do some other stuff independent of nvim.
  if has('nvim')
    autocmd FileType fzf tunmap <buffer> <C-h>
    autocmd FileType fzf tunmap <buffer> <C-j>
    autocmd FileType fzf tunmap <buffer> <C-k>
    autocmd FileType fzf tunmap <buffer> <C-l>
  endif
augroup END

au TermOpen * setlocal nonumber norelativenumber
