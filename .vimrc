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


" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Bundle 'tobyS/skeletons.vim'

" Plugin 'WolfgangMehner/c-support'

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
nnoremap <leader>s :UltiSnipsEdit <esc>
inoremap jk <esc>
inoremap <esc> <nop>
iabbrev c@ int main(int argc, char \* argv){<cr> <Tab>return 0; <cr>}
