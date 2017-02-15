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

set tabstop=4
set expandtab
set shiftwidth=4
syntax on
:inoremap <S-Tab> <C-V><Tab>
" au BufRead,BufNewFile *.html set filetype=htmldjango
