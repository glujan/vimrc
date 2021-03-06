set nocompatible
filetype off

call plug#begin()
" UI
Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'

" Langs
Plug 'python-mode/python-mode', {'for': 'python', 'branch': 'develop'}
Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoInstallBinaries'}
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'tpope/vim-rails', {'for': 'ruby'}

" Tools
Plug 'psf/black', {'for': 'python'}
Plug 'tpope/vim-bundler', {'for': 'ruby'}
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

" color 80th and 120+ rows
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,".join(range(100,999),",")

"~~~~~~~~~~ Plugins config ~~~~~~~~~~"

" airline
if !exists('g:airline_symbols')
   let g:airline_symbols={}
endif

set laststatus=2
set noshowmode " get rid of mode message like --INSERT--

let g:airline_symbols.linenr='␊'
let g:airline_symbols.linenr='␤'
let g:airline_symbols.linenr='¶'
let g:airline_symbols.branch='⎇'
let g:airline_symbols.paste='ρ'
let g:airline_symbols.paste='Þ'
let g:airline_symbols.paste='∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.whitespace='Ξ'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" nerdcommenter
let NERDSpaceDelims=1

" ctrlp
let g:ctrlp_max_height=15
let g:ctrlp_custom_ignore='node_modules\|\v[\/]\.(git|hg|svn|tox)$'
let g:ctrlp_open_multiple_files='t'
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

" python-mode
let g:pymode_python = 'python3'
let g:pymode_rope=1
let g:pymode_rope_goto_definition_bind='<Leader>g'
let g:pymode_rope_goto_definition_cmd="vnew"

let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_lint_sort=['E', 'I', 'C']
let g:pymode_virtualenv=1
let g:pymode_breakpoint_cmd='import pudb; pudb.set_trace()  # XXX BREAKPOINT'
let g:pymode_options_max_line_length=100

" NeoVim
let g:python3_host_prog = '~/.pyenv/versions/neovim/bin/python'
let g:python_host_prog = '~/.pyenv/versions/neovim-py2/bin/python'

" Black
let g:black_virtualenv = '~/.pyenv/versions/black/'
let g:black_linelength = 99
" automatically run Black on save
autocmd BufWritePre *.py execute ':Black'

" OmniPopup
set completeopt=longest,menuone
function! OmniPopup(action)
	if pumvisible()
		if a:action == 'j'
			return "\<C-N>"
		elseif a:action == 'k'
			return "\<C-P>"
		endif
	endif
	return a:action
endfunction
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


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

" enable CSS auto completion automatically
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

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
