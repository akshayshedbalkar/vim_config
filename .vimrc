"VIM SETTINGS
set nu
"set relativenumber
"set background=dark
set hlsearch
set incsearch
set tags=./tags,tags;$HOME
set backspace=2
set hidden
set autoread
filetype plugin indent on
syntax enable
colo holokai
"colo evening
let mapleader = " "
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Leader>c :%s///ng <CR> 
inoremap <C-l> <C-o>a
nnoremap <Leader>n :noh<CR>

"PLUGIN SETTINGS
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <F9> :TagbarToggle<CR>
let delimitMate_expand_cr = 1
let g:airline#extensions#whitespace#enabled = 0
"let g:airline_extensions = []
"let g:airline#extensions#tabline#enabled = 1
