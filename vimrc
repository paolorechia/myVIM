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

" Plugin 'scrooloose/nerdcommenter'

" Plugin 'tpope/vim-fugitive'

" Plugin 'easymotion/vim-easymotion'

" Plugin 'tpope/vim-surround'

"Plugin 'pangloss/vim-javascript'

"Plugin 'vim-scripts/django.vim'

"Plugin 'python-mode/python-mode'

"Plugin 'python-syntax'

call vundle#end()


" Custom setup
set expandtab
set tabstop=2
set shiftwidth=2
syntax enable

inoremap <S-Tab> <C-V><Tab>
let mapleader = ','
let maplocalleader = '-'
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>q viw<esc>a"<esc>bi"<esc>
nnoremap <leader>qs viw<esc>a'<esc>bi'<esc>
nnoremap <leader>p A;<esc>
nnoremap <leader>i >><esc>
autocmd BufNewFile * :write
autocmd BufWritePre *.java :normal gg=G 
"autocmd BufRead *.java nnoremap <buffer> <LocalLeader>c 0i//<esc>
autocmd FileType java nnoremap <buffer> <LocalLeader>c 0i//<esc>
inoremap jk <esc>
inoremap <esc> <nop>
iabbrev c@ int main(int argc, char \* argv){<cr> <Tab>return 0; <cr>}
