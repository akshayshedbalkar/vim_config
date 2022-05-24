"AUTO COMMANDS
autocmd ColorScheme holokai hi Function ctermfg=208
autocmd ColorScheme * hi Normal ctermbg=none
autocmd FileType python setlocal equalprg=yapf
autocmd FileType python setlocal makeprg=python\ %
" autocmd FileType c,cpp setlocal equalprg=clang-format\ -style=\"{BasedOnStyle:\ microsoft,\ ColumnLimit:\ 150,\ SortIncludes:\ false,\ CommentPragmas:\ '^\ polyspace',\ ReflowComments:\ true,\ AlignTrailingComments:\ true}\"
" autocmd FileType c,cpp setlocal equalprg=clang-format\ -style=\"{BasedOnStyle:\ chromium,\ BreakBeforeBraces:\ Allman,\ SortIncludes:\ false,\ CommentPragmas:\ '^\ polyspace',\ ReflowComments:\ true,\ AlignTrailingComments:\ true}\"
autocmd FileType c,cpp setlocal makeprg=make\ -s\ -C\ $*

"VIM SETTINGS
colo holokai
filetype plugin indent on
syntax enable
let mapleader=" "
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

"PLUGIN SETTINGS
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <F9> :NERDTreeFind<CR>
noremap <Leader>t :Tabularize /
nnoremap <Leader>p :Rg<CR>
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <C-b> :GBranches<CR>
command -nargs=1 Gdy :Git difftool -y <args>
let NERDTreeIgnore = ['^RP_SRC*','^Review','^doc','^test', 'build$', '^tags', 'compile_commands.json']
let delimitMate_expand_cr = 1
let g:airline#extensions#whitespace#enabled = 0
let g:DoxygenToolkit_authorName="Akshay Shedbalkar"
let g:termdebug_wide = 1
let g:fzf_layout = { 'down': '~40%' }
let g:lsc_auto_map = {'defaults': v:true, 'PreviousReference': ''}
let g:lsc_server_commands = {
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

"PROJECT SETTINGS
nnoremap <Leader>s :grep -r --exclude-dir={cmake-build-debug,build,config,.git,tasking_build,delivery_build,tools,doc,cmocka,test,scripts,.vscode} --exclude={tags,*.swp,*.sqlite,*.obj,*.a,*.html,*.exe,*.rdump} <cword> .<CR>
command -nargs=1 Search :grep -r --exclude-dir={cmake-build-debug,build,config,.git,tasking_build,delivery_build,tools,doc,cmocka,test,scripts,.vscode} --exclude={tags,*.swp,*.sqlite,*.obj,*.a,*.html,*.exe,*.rdump} <args> .
command -nargs=+ Refactor :cfdo %s/<args>/g|update
