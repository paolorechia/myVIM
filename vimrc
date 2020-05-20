

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" File navigation and exploration
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'kien/ctrlp.vim'

Plugin 'arcticicestudio/nord-vim'

" Tmux integration
Plugin 'tmux-plugins/vim-tmux-focus-events'

" Auto quote matching 
Plugin 'Raimondi/delimitMate'

" Git integration
Plugin 'tpope/vim-fugitive'


" Easy commenting
" Needs tweaking
Plugin 'tpope/vim-commentary'

" Easy motion
Plugin 'easymotion/vim-easymotion'

" Airline!
Plugin 'vim-airline/vim-airline'

" Syntax highlighting
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'maxmellon/vim-jsx-pretty'

" Rust plugins
Plugin 'rust-lang/rust.vim'

" Haskell
Plugin 'neovimhaskell/haskell-vim'

call vundle#end()


" ControlP search only inside root dir
let g:ctrlp_working_path_mode = 0


" Custom General Setup
set expandtab
set tabstop=2
set shiftwidth=2
syntax enable

inoremap jk <esc>

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Navigate between diagnostics
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Highlight the symbol and its references when holding the cursor.

" This currently bugs the cursor
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Find equivalent for coc to fix it
" let g:ale_echo_cursor = 0  " Fix cursor bug for Ubuntu 18.04


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>r  <Plug>(coc-format-selected)
nmap <leader>r  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
