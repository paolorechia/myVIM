" Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required


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

" Git integration
Plugin 'tpope/vim-fugitive'

" Powerline!
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Syntax highlighting, linting
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'w0rp/ale'

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
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'

" Custom General Setup
set expandtab
set tabstop=2
set shiftwidth=2
syntax enable

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

"autocmd BufRead *.java nnoremap <buffer> <LocalLeader>c 0i//<esc>
autocmd FileType java nnoremap <buffer> <LocalLeader>c 0i//<esc>
autocmd FileType c nnoremap <buffer> <LocalLeader>c 0i//<esc>
autocmd FileType c nnoremap <buffer> <LocalLeader>u 0xx<esc>
autocmd FileType c nnoremap <buffer> <LocalLeader>i 0iif( ){}<esc>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
