set nocompatible
filetype off

call plug#begin()
" UI
Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'

" Langs
Plug 'davidhalter/jedi-vim', {'for': 'python'},
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoInstallBinaries'}

" Tools
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lokikl/vim-ctrlp-ag'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' "Gbrowse
Plug 'majutsushi/tagbar' "depends on 'exuberant-ctags'
call plug#end()

"~~~~~~~~~~ Key bindings ~~~~~~~~~~"
let mapleader=","

" highlight found phrase
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" navigate windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" navigate tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
map <Leader>q <esc>:tabclose<CR>

" sort selection alphabetically
vnoremap <Leader>s :sort<CR>

" move block left or right
vnoremap < <gv
vnoremap > >gv

" insert newline without entering input mode
nnoremap <leader>j a<CR><Esc>k$

" auto completion
inoremap <leader>, <C-x><C-o>

"~~~~~~~~~~ View config ~~~~~~~~~~"

colorscheme PaperColor
set background=light
set termguicolors

" color 100th and 120+ rows
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="100,".join(range(120,999),",")

"~~~~~~~~~~ Plugins config ~~~~~~~~~~"

" airline
if has('autocmd')
  augroup airline_init
    autocmd!
    autocmd User AirlineAfterInit
      \ call s:airline_init()
  augroup END
endif

function! s:airline_init()
  let g:airline_section_b = airline#section#create(['branch'])
  let g:airline#extensions#default#section_truncate_width = {
      \ 'b': 99,
      \ 'x': 60,
      \ 'y': 88,
      \ 'z': 45,
      \ 'warning': 80,
      \ 'error': 80,
      \ }
    if airline#util#winwidth() > 79
      let g:airline_section_z = airline#section#create(['windowswap', 'obsession', 'linenr', 'maxlinenr', 'colnr'])
    else
      let g:airline_section_z = airline#section#create(['linenr', 'colnr'])
    endif
endfunction

if !exists('g:airline_symbols')
   let g:airline_symbols={}
endif

set laststatus=2
set noshowmode " get rid of mode message like --INSERT--
let g:airline_skip_empty_sections = 1
let g:airline#extensions#branch#displayed_head_limit = 20
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_symbols.branch='⎇ '
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.maxlinenr = ''

" nerdcommenter
let NERDSpaceDelims=1

" ctrlp
let g:ctrlp_max_height=15
let g:ctrlp_custom_ignore='node_modules\|\v[\/]\.(git|hg|svn|tox)$'
let g:ctrlp_open_multiple_files='t'
let g:ctrlp_extensions = ['autoignore']
set wildignore+=*.pyc
set wildignore+=*__pycache__/*
set wildignore+=*build/*
set wildignore+=*dist/*
set wildignore+=*.egg-info/*
set wildignore+=*/coverage/*
set wildignore+=*/vendor/*

" ctrlp-ag
nnoremap <c-f> :CtrlPag<cr>
vnoremap <c-f> :CtrlPagVisual<cr>

" jedi-vim
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#show_call_signatures = "1"

map <Leader>b <esc>Obreakpoint()  # XXX BREAKPOINT<esc>

let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fixers.python = ['isort', 'autoflake']
let g:ale_fix_on_save = 1
let g:ale_linters = {'python': ['flake8', 'mypy', 'pyright', 'bandit']}

"~~~~~~~~~~ Miscellaneous ~~~~~~~~~~"

" automatically reload .vimrc
autocmd! bufwritepost .vimrc source %

" filetype recognition, highlight syntax, spell check
filetype plugin indent on
set ff=unix
syntax on
set spell

" mouse
set bs=2
set mouse=a

" row number and width
set number
set textwidth=79
set nowrap
set fo-=t "don't automatically wrap text when typing
set winwidth=60

" tab to 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" search
set incsearch
set hlsearch
set ignorecase
set smartcase
set scrolloff=3

" no backup & swap
set nobackup
set nowritebackup
set noswapfile

" encoding
if v:ctype =~ "UTF-8"
	set tenc=utf8
else
	set tenc=latin2
endif
set enc=utf8
" latin2 catches everything; it makes no sense to set anything after it
set fileencodings=ucs-bom,utf-8,latin2
set smartindent

set tabpagemax=50
set foldlevelstart=1
set wildmenu

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=0
