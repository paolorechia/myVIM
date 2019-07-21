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

Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'

Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'w0rp/ale'

call vundle#end()

let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'

" Custom setup
set expandtab
set tabstop=2
set shiftwidth=2
set tw=79
syntax enable

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
