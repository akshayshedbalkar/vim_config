set nu
"set background=dark
set hlsearch
set incsearch

filetype plugin indent on
syntax enable
colo molokai_dark

let delimitMate_expand_cr = 1

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <F9> :TagbarToggle<CR>
"let g:airline#extensions#tabline#enabled = 1
