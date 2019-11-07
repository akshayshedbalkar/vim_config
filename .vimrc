"VIM SETTINGS
filetype plugin indent on
syntax enable
colo holokai
let mapleader = " "
set nu
set hlsearch
set incsearch
set tags=./tags,tags;$HOME
set backspace=2
set hidden
set autoread
set tabstop=4
set shiftwidth=4
set expandtab
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Leader>c :%s///ng <CR> 
nnoremap <Leader>n :noh<CR>
nnoremap <Leader>e :SyntasticReset<CR>
nnoremap <Leader>p :CtrlPTag<CR>
inoremap <C-l> <C-o>a

"PLUGIN SETTINGS
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <F9> :TagbarToggle<CR>
let delimitMate_expand_cr = 1
let g:airline#extensions#whitespace#enabled = 0

"PROJECT SETTINGS
nnoremap <Leader>s :grep -r --exclude-dir={cmake-build-debug,build} --exclude={tags,*.swp,*.sqlite,*.obj,*.a,*.html,*.exe} <cword> .>
command! -nargs=1 Search :grep -r --exclude-dir={cmake-build-debug} --exclude={tags,*.swp,*.sqlite,*.obj,*.a,*.html,*.exe} <args> .
command! -nargs=+ Refactor :cfdo %s/<args>/g|update
let &makeprg='(cd build_dir && mingw32-make)'
"let &makeprg='(cd build_dir && mktc)'
