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

Plugin 'scrooloose/nerdcommenter'

Plugin 'Valloric/YouCompleteMe'

Plugin 'tpope/vim-fugitive'

Plugin 'easymotion/vim-easymotion'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'tpope/vim-surround'

Plugin 'pangloss/vim-javascript'

Plugin 'vim-scripts/django.vim'

Plugin 'python-mode/python-mode'

Plugin 'python-syntax'


call vundle#end()
filetype plugin indent on
set tabstop=4
set expandtab
set shiftwidth=4
syntax enable

"set background=dark
"colorscheme solarized 
:inoremap <S-Tab> <C-V><Tab>
" au BufRead,BufNewFile *.html set filetype=htmldjango
