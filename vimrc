" Start Vundle plugin management

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" fzf.vim
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

" All kinds of awesome git integration
Plugin 'tpope/vim-fugitive'

" navigate vim and tmux splits with ctrl hjkl
Plugin 'christoomey/vim-tmux-navigator'

" grep plugin
Plugin 'mileszs/ack.vim'

" Mostly use this for ]q and [q in the quickfix list
Plugin 'tpope/vim-unimpaired'

" Commenting superpowers
Plugin 'preservim/nerdcommenter'

" Visuals
Plugin 'junegunn/seoul256.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/rainbow_parentheses.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" End Vundle plugin management

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A lot of this vimrc comes from
"   Amir Salihefendic — @amix3k
"   https://github.com/amix/vimrc
"
"   Gary Bernhardt
"   https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
"
" With a bit of my own config
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"    -> Filetype specifics
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Disable error bells
set vb t_vb=

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
"
" Fast saving
nmap <leader>w :w!<cr>

" Use absolute number for current line but relativenumbers
" for other lines
set number relativenumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Diffs are shown side-by-side not above/below
set diffopt=vertical

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Always show current position
set ruler

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
 
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Add a bit extra margin to the left
set foldcolumn=1

" use cursorline in normal mode but not in insert mode
set cursorline
autocmd InsertEnter * set nocul
autocmd InsertLeave * set cul

" Set gvim fonts
if has("gui_running")
    " Disables all of the default GUI options including displaying
    " the menubar, the toolbar, and scrollbars
    set guioptions=

    " copy to clipboard automatically from gvim
    set guioptions +=a

    if has("gui_gtk2")
        set guifont=Inconsolata\ 12
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h14
    elseif has("gui_win32")
        " opens gvim full screen
        " https://vi.stackexchange.com/a/1938
        autocmd GUIEnter * simalt ~x
        set guifont=Consolas:h11:cANSI
    endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" True color mode! (Requires a fancy modern terminal, but iTerm works.)
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Enable syntax highlighting
syntax enable 
let g:seoul256_background = 233
colo seoul256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Fix indenting on C switch cases
" https://stackoverflow.com/questions/3444696/how-to-disable-vims-indentation-of-switch-case
set cinoptions=l1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

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

" last opened file with ,,
nnoremap <leader><leader> <c-^>

" copy to clibpard with ,y
nnoremap <leader>y "*y
vnoremap <leader>y "*y

" clear the search buffer after hitting return
nnoremap <CR> :noh<cr>

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

if has("autocmd")
  autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Super cool function from Gary Bernhardt's dotfiles:
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col
    return "\<tab>"
  endif

  let char = getline('.')[col - 1]
  if char =~ '\k'
    " There's an identifier before the cursor, so complete the identifier.
    return "\<c-p>"
  else
    return "\<tab>"
  endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => fugitive
""""""""""""""""""""""""""""""
nnoremap <silent> <leader>gs :G<cr>
nnoremap <silent> <leader>gb :Git blame<cr>
nnoremap <silent> <leader>gl :Gclog<cr>
nnoremap <silent> <leader>go :0Gclog<cr>
nnoremap <silent> <leader>gwr :Gwrite<cr>
nnoremap <silent> <leader>gco :Git commit<cr>

""""""""""""""""""""""""""""""
" => fzf.vim
""""""""""""""""""""""""""""""
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <leader>l :Lines<CR>
nnoremap <silent> <leader>f :Rg 
nnoremap <silent> <leader>d :call SearchWordWithRg()<CR>
vnoremap <silent> <leader>d :call SearchVisualSelectionWithRg()<CR>
nnoremap <silent> <leader>gfl :Commits<CR>
nnoremap <silent> <leader>gfo :BCommits<CR>
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

function! SearchWordWithRg()
    execute 'Rg' expand('<cword>')
endfunction

function! SearchVisualSelectionWithRg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Rg' selection
endfunction

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

""""""""""""""""""""""""""""""
" => ack.vim
""""""""""""""""""""""""""""""
if executable("rg")
    let g:ackprg = 'rg --vimgrep --no-heading'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filetype specifics
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set groovy syntax highlighting for Jenkinsfile
au BufNewFile,BufRead Jenkinsfile setf groovy

" Sets tab and shift widths to 4 and line lengths to 79 per pep8
" Sets fileformat to unix to fix CRLF line endings
au BufNewFile,BufRead *.py  setlocal ts=4 sw=4 expandtab autoindent textwidth=75 fileformat=unix
" Fold based on indent level. foldcolumn defaults to everything being unfolded
" when the file opens. foldcolumn=0 does not display indent level on the 
" left-hand side.
au BufNewFile,BufRead *.py  setlocal foldmethod=indent foldcolumn=0 foldlevel=99

au BufNewFile,BufRead *.js setlocal ts=2 sw=2

au BufNewFile,BufRead *.md setlocal textwidth=72
au BufNewFile,BufRead *.txt setlocal textwidth=72

augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

