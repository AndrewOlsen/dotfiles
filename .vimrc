"" Get list of plugin help files
"" :help local-additions

"" View help on current word
"" :help <C-r><C-w>

set nocompatible

"" Filetype synatax
filetype plugin on
syntax on
filetype indent plugin on

"" Set line number and relatives
set number
if exists( '+rnu' ) | set relativenumber | endif

"" Enable mouse control
set mouse=a
set hidden
let g:vim_markdown_folding_disabled = 1

"" Plugin installer
call plug#begin('~/.vim/bundle')

"" Vim keybinds
""   toggle line number 'con'
""   toggle relative number 'cor'
""   toggle spelling 'cos'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sensible'

"" Vim Unix Commands
""   move, sudowrite, chmod, mkdir, rename, find
Plug 'tpope/vim-eunuch'

"" Edit surrounding characters""
""    change surrounding => cs'"
""    Delete surrounding => ds'"
""    'you' surround => ysiw"
Plug 'tpope/vim-surround'

"" Undo tree menu
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}

"" Plugin stuff
Plug 'shougo/vimproc', {'do': 'make'}

"" Matching parantheses, quotes etc
Plug 'Raimondi/delimitMate'

"" Close statements if, for etc
Plug 'tpope/vim-endwise'

"" Error checking
Plug 'w0rp/ale'

"" Vim statusbar
Plug 'vim-airline/vim-airline'

"" Vim airline themes
Plug 'vim-airline/vim-airline-themes'

"" Completion Engine
Plug 'Shougo/neocomplete.vim'

"" Better search
Plug 'haya14busa/incsearch.vim'
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)
  map N  <Plug>(incsearch-nohl-N)
  map *  <Plug>(incsearch-nohl-*)
  map #  <Plug>(incsearch-nohl-#)
  map g* <Plug>(incsearch-nohl-g*)
  map g# <Plug>(incsearch-nohl-g#)
  let g:incsearch#consistent_n_direction = 1
  let g:incsearch#auto_nohlsearch = 1
  let g:incsearch#magic = '\v'

"" fzf for vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

"" Rust configuration
Plug 'rust-lang/rust.vim'

"" ember hbs plugin
Plug 'joukevandermaas/vim-ember-hbs'
call plug#end()

"" Gundo settings
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1

"" Map gundo to F5
nnoremap <silent> <F5> <Esc>:GundoToggle<CR>

"" Map for Neocomplete
let g:completionEngine = 'neocomplete'
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"" Save undos and :ex history
if version >= 703
    if exists("&undodir")
        set undodir=~/.vim/undo//
    endif
    set undofile
    set undoreload=10000
endif
set undolevels=10000
if exists("&backupdir")
    set backupdir=~/.vim/backups//
endif
if exists("&directory")
    set directory=~/.vim/swaps//
endif

"" Ruler stuff
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

"" Airline
let g:airline_theme='term'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"let g:airline_symbols_ascii = 1
let base16colorspace=256

" unicode symbols
"let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = 'b'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

" ale settings
let g:ale_lint_on_save=1
let g:ale_lint_on_text_change=0
nmap <F8> <Plug>(ale_fix)
