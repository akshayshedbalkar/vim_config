vim9script

#PLUGIN MANAGEMENT
plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround' 
Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/vis'
Plug 'vim-scripts/VisIncr'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'mkitt/tabline.vim'
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'natebosch/vim-lsc'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kassio/neoterm'
Plug 'akshayshedbalkar/atm.vim'
Plug 'changyuheng/color-scheme-holokai-for-vim'
Plug 'joshdick/onedark.vim'
Plug 'PProvost/vim-ps1'
plug#end()

#AUTO COMMANDS
autocmd ColorScheme holokai hi Function ctermfg=208
autocmd ColorScheme * hi Normal ctermbg=none
autocmd FileType python setlocal equalprg=yapf
autocmd FileType python setlocal makeprg=python\ %
autocmd FileType c,cpp setlocal makeprg=make\ -s\ -C\ $*

#VIM SETTINGS
colo onedark
filetype plugin indent on
syntax enable
var mapleader = " "
set nu
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set noshowmode
set diffopt+=vertical
set completeopt-=preview
set efm+=ctc\ %t%n:\ [\"%f\"\ %l\/%c]%m
set hlsearch
set incsearch
set backspace=2
set hidden
set autoread
set wildmenu
set visualbell
set t_vb=
nmap gd <C-]>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Leader>c :%s///ng <CR> 
nnoremap <Leader>n :noh<CR>
nnoremap <Leader>x :%!xxd<CR>
nnoremap <Leader>2 :diffget //2<CR> :diffupdate<CR>
nnoremap <Leader>3 :diffget //3<CR> :diffupdate<CR>
nnoremap <Leader>d A  /*!<  */<ESC>hhi
inoremap <C-l> <C-o>a
set directory=$HOME/.vim/swapfiles

#PLUGIN SETTINGS
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <F9> :NERDTreeFind<CR>
noremap <Leader>t :Tabularize /
nnoremap <Leader>p :Rg<CR>
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <C-b> :GBranches<CR>
command -nargs=1 Gdy :Git difftool -y <args>
var NERDTreeIgnore = ['^RP_SRC*', '^Review', '^doc', '^test', 'build$', '^tags', 'compile_commands.json']
var delimitMate_expand_cr = 1
g:airline#extensions#whitespace#enabled = 0
g:DoxygenToolkit_authorName = "Akshay Shedbalkar"
g:termdebug_wide = 1
g:fzf_layout = { 'down': '~40%' }
g:lsc_auto_map = {'defaults': v:true, 'PreviousReference': ''}
g:lsc_server_commands = {
    \ 'cpp': {
        \ 'command': 'clangd --background-index',
        \ 'suppress_stderr': v:true
    \},
    \ 'c': {
        \ 'command': 'clangd --background-index',
        \ 'suppress_stderr': v:true
    \},
    \ 'python': {
        \ 'command': 'pylsp',
        \ 'suppress_stderr': v:true
    \},
    \ 'rust': {
        \ 'command': 'rust-analyzer',
        \ 'suppress_stderr': v:true
    \}
\}

#PROJECT SETTINGS
nnoremap <Leader>s :grep -r --exclude-dir={cmake-build-debug,build,config,.git,tasking_build,delivery_build,tools,doc,cmocka,test,scripts,.vscode} --exclude={tags,*.swp,*.sqlite,*.obj,*.a,*.html,*.exe,*.rdump} <cword> .<CR>
command -nargs=1 Search :grep -r --exclude-dir={cmake-build-debug,build,config,.git,tasking_build,delivery_build,tools,doc,cmocka,test,scripts,.vscode} --exclude={tags,*.swp,*.sqlite,*.obj,*.a,*.html,*.exe,*.rdump} <args> .
command -nargs=+ Refactor :cfdo %s/<args>/g|update
