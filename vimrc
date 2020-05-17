" Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" File navigation and exploration
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'kien/ctrlp.vim'

Plugin 'arcticicestudio/nord-vim'


" ControlP search only inside root dir
let g:ctrlp_working_path_mode = 0

" Git integration
Plugin 'tpope/vim-fugitive'

" Tmux integration
Plugin 'tmux-plugins/vim-tmux-focus-events'

" Easy commenting
" Needs tweaking
Plugin 'tpope/vim-commentary'

" Easy motion
Plugin 'easymotion/vim-easymotion'

" Airline!
Plugin 'vim-airline/vim-airline'

" Auto quote matching 
Plugin 'Raimondi/delimitMate'
" Syntax highlighting, linting
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'w0rp/ale'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'mlaursen/vim-react-snippets'

" Basic keybindings
inoremap <c-a> <nop>
nnoremap <c-a> <nop>
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" vim-hug-neovim-rpc
set pyxversion=3
set encoding=utf-8

" deoplete plugins
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
let g:deoplete#enable_at_startup = 1

" Python plugins
Plugin 'vim-scripts/indentpython.vim'

call vundle#end()

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['pylint'],
\}
let b:ale_fixers = { 
\  'javascript': ['prettier', 'eslint']
\}

" Rust plugins
Plugin 'rust-lang/rust.vim'

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_echo_cursor = 0  " Fix cursor bug for Ubuntu 18.04

" Custom General Setup
set expandtab
set tabstop=2
set shiftwidth=2
syntax enable


inoremap jk <esc>

" Deoplete auto-complete key mapping to tab
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <S-Tab> <C-V><Tab>
let mapleader = ','
let maplocalleader = 's'
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>q viw<esc>a"<esc>bi"<esc>
nnoremap <leader>qs viw<esc>a'<esc>bi'<esc>
nnoremap <leader>p A;<esc>
nnoremap <leader>i >><esc>
nnoremap <leader>t :NERDTreeToggle <esc>
autocmd BufNewFile * :write
autocmd BufWritePre *.java :normal gg=G 


" Clipboard shortcuts
noremap <Leader>y "+y
noremap <Leader>p "+p

""""""""""" Easy motion config
"<Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

"s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

"Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

"Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
"""""""""""

"autocmd BufRead *.java nnoremap <buffer> <LocalLeader>c 0i//<esc>
autocmd FileType java nnoremap <buffer> <LocalLeader>c 0i//<esc>
autocmd FileType c nnoremap <buffer> <LocalLeader>c 0i//<esc>
autocmd FileType c nnoremap <buffer> <LocalLeader>u 0xx<esc>
autocmd FileType c nnoremap <buffer> <LocalLeader>i 0iif( ){}<esc>


" Vim fugitive shortcuts
nnoremap <Leader>d :Gvdiffsplit! <CR>
nnoremap <Leader>a :Gadd
nnoremap <Leader>c :Gcommit
nnoremap <Leader>dh :diffget //2<CR>
nnoremap <Leader>dl :diffget //3<CR>


" Buffer navigation
nnoremap <C-h> :bp<cr>
nnoremap <C-l> :bn<cr>


" Python specific config "
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Custom silent
command! -nargs=1 Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'

colorscheme nord

" Turn on line numbers
set number

" Integrate ALE linter with airline
let g:airline#extensions#ale#enabled = 1

" Ale error jumping
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
