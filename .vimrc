"VIM SETTINGS
filetype plugin indent on
syntax enable
colo holokai
let mapleader=" "
set nu
set hlsearch
set incsearch
set backspace=2
set hidden
set autoread
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set noshowmode
set diffopt+=vertical
set wildmenu
set visualbell
set t_vb=
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Leader>c :%s///ng <CR> 
nnoremap <Leader>n :noh<CR>
nnoremap <Leader>r "0p
noremap <Leader>f $%
nnoremap <Leader>x :%!xxd<CR>
nnoremap <Leader>xr :%!xxd -r<CR>
nnoremap <Leader>2 :diffget //2<CR> :diffupdate<CR>
nnoremap <Leader>3 :diffget //3<CR> :diffupdate<CR>
noremap <F12> :%!clang-format -style="{BasedOnStyle: microsoft, ColumnLimit: 150, ReflowComments: true}"<CR>
inoremap <C-l> <C-o>a
set efm+=ctc\ %t%n:\ [\"%f\"\ %l\/%c]%m

"PLUGIN SETTINGS
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <F9> :NERDTreeFind<CR>
noremap <Leader>t :Tabularize /
nnoremap <Leader>p :Ag<CR>
nnoremap <C-p> :Files<CR>
let delimitMate_expand_cr = 1
let g:airline#extensions#whitespace#enabled = 0
let g:DoxygenToolkit_authorName="Akshay Shedbalkar"
let NERDTreeIgnore = ['^RP_SRC*','^Review','^doc','^test', 'build$', 'compile_commands.json']
let g:snipMate = { 'snippet_version' : 1 }
let g:termdebug_wide = 16
let g:lsc_server_commands = {
    \ 'cpp': {
        \ 'command': 'clangd --background-index',
        \ 'suppress_stderr': v:true
    \},
    \ 'c': {
        \ 'command': 'clangd --background-index',
        \ 'suppress_stderr': v:true
    \},
    \ 'python': 'pyls',
\}
let g:lsc_auto_map = {'defaults': v:true, 'GoToDefinition': 'gd', 'PreviousReference': ''}
autocmd CompleteDone * silent! pclose
let g:fzf_layout = { 'down': '~40%' }

"PROJECT SETTINGS
nnoremap <Leader>s :grep -r --exclude-dir={cmake-build-debug,build,config,.git,tasking_build,delivery_build,tools,doc,cmocka,test,scripts,.vscode} --exclude={tags,*.swp,*.sqlite,*.obj,*.a,*.html,*.exe,*.rdump} <cword> .<CR>
command! -nargs=1 Search :grep -r --exclude-dir={cmake-build-debug,build,config,.git,tasking_build,delivery_build,tools,doc,cmocka,test,scripts,.vscode} --exclude={tags,*.swp,*.sqlite,*.obj,*.a,*.html,*.exe,*.rdump} <args> .
command! -nargs=+ Refactor :cfdo %s/<args>/g|update
let &makeprg='(cd ./$* && make)'
