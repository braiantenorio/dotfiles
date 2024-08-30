set nocompatible              " be iMproved, required
filetype off                  " required

set shell=/bin/bash
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'sjl/gundo.vim'
Plugin 'godlygeek/tabular'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'TomNomNom/xoria256.vim'
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'


" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hoste
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
" Highlighting
syntax on

set encoding=utf-8

" Airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'

" History
set history=50

" Display
set ls=2
set showmode
set showcmd
set modeline
set ruler
"set title
set nu

" Line wrapping
set nowrap
set linebreak
set showbreak=▹

" Auto indent what you can
set autoindent

" Searching
set ignorecase
set smartcase
set gdefault
set hlsearch
set showmatch

" Enable jumping into files in a search buffer
set hidden

" Make backspace a bit nicer
set backspace=eol,start,indent

" Indentation
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set expandtab

" Disable mouse
set mouse=

" Colorscheme
if &t_Co == 256
    try
        color xoria256
    catch /^Vim\%((\a\+)\)\=:E185/
        " Oh well
    endtry
endif

" Switch tabs
map 8 <Esc>:tabe
map 9 gT
map 0 gt

" Gundo toggle
map <F5> <Esc>:GundoToggle<CR>

" Toggle line-wrap
map <F6> <Esc>:set wrap!<CR>

" Open file under cursor in new tab
map <F9> <Esc><C-W>gF<CR>:tabm<CR>

" Direction keys for wrapped lines
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" Bash / emacs keys for command line
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Base64 decode word under cursor
nmap <Leader>b :!echo <C-R><C-W> \| base64 -d<CR>

" grep recursively for word under cursor
nmap <Leader>g :tabnew\|read !grep -Hnr '<C-R><C-W>'<CR>

" sort the buffer removing duplicates
nmap <Leader>s :%!sort -u --version-sort<CR>

" Visual prompt for command completion
set wildmenu

" Write current file with sudo perms
"command! W w !sudo tee % > /dev/null
command! W w
command! -bang Qall qall

" folding
set nofoldenable

" Open word under cursor as ctag in new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

if $VIMENV == 'talk'
  set background=light
  let g:solarized_termcolors=256
  colo solarized
  noremap <Space> :n<CR>
  noremap <Backspace> :N<CR>
else
  " Trans background
"  hi Normal ctermbg=none
 " hi NonText ctermbg=none
endif

if $VIMENV == 'prev'
  noremap <Space> :n<CR>
  noremap <Backspace> :N<CR>
  noremap <C-D> :call delete(expand('%')) <bar> argdelete % <bar> bdelete<CR>
  set noswapfile
endif
