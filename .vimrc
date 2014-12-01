set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'klen/python-mode'
Bundle 'airblade/vim-gitgutter'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'bling/vim-airline'
Bundle 'tomasr/molokai'
" Plugin 'JarrodCTaylor/vim-python-test-runner'
Plugin 'tpope/vim-fugitive'

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
nnoremap <C-J> a<CR><Esc>k$

" autocompetion
inoremap <leader>, <C-x><C-o>

"~~~~~~~~~~ View config ~~~~~~~~~~"

" molokai theme
colorscheme molokai

if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

"~~~~~~~~~~ Plugins config ~~~~~~~~~~"

" airline
if !exists('g:airline_symbols')
   let g:airline_symbols={}
endif

set laststatus=2
set noshowmode

let g:airline_left_sep='»'
let g:airline_left_sep='▶'
let g:airline_right_sep='«'
let g:airline_right_sep='◀'
let g:airline_symbols.linenr='␊'
let g:airline_symbols.linenr='␤'
let g:airline_symbols.linenr='¶'
let g:airline_symbols.branch='⎇'
let g:airline_symbols.paste='ρ'
let g:airline_symbols.paste='Þ'
let g:airline_symbols.paste='∥'
let g:airline_symbols.whitespace='Ξ'

" nerdcommenter
let NERDSpaceDelims=1

" ctrlp
let g:ctrlp_max_height=15
let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn)$'
let g:ctrlp_open_multiple_files='t'
set wildignore+=*.pyc
set wildignore+=*build/*
set wildignore+=*dist/*
set wildignore+=*.egg-info/*
set wildignore+=*/coverage/*

" python-mode
let g:pymode_rope=1
let g:pymode_rope_goto_definition_bind='<Leader>g'
let g:pymode_rope_goto_definition_cmd="vnew"

let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_lint_sort=['E', 'I', 'C']
let g:pymode_virtualenv=1

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

" better copying / pasting
set pastetoggle=<F2>
set clipboard=unnamed

" filertype recognition, highlight syntax
filetype plugin indent on
syntax on

" mouse
set bs=2
set mouse=a

" row number and width
set number
set textwidth=79
set nowrap
set fo-=t "don't automatically wrap text when typing
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")

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

" enable CSS autocompletion automatically
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
