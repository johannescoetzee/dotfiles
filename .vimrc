" Setup Vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins to install
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomtom/tcomment_vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ajh17/VimCompletesMe'

call vundle#end()
filetype plugin indent on

if !has('gui_running')
    set t_Co=256
endif

" set fonts
set guifont=Inconsolata\ for\ Powerline\ 12
let g:airline_powerline_fonts = 1

" auto start NERDTree
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" hz is escape
inoremap hz <esc>

nnoremap <F5> :w<CR>:buffers<CR>:buffer<Space>
inoremap /**<CR> /**<CR><BS><BS>**/<Esc>O<BS> * 

" Automatically do double curly braces
inoremap {<CR> {<CR>}<Esc>O
inoremap {{<CR> {}<Esc>i

inoremap (<CR> (<CR>)<Esc>O
inoremap ((<CR> ()<Esc>i

inoremap [<CR> [<CR>]<Esc>O
inoremap [[<CR> []<Esc>i

colorscheme molokai-dark

" Enable line numbering
" set number

" Set to auto read when a file is changed from the outside
set autoread

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" Make search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" Enable syntax highlighting
syntax enable

" Set utf8 as the standard encoding and en_US as the standard language
set encoding=utf8

" Use unix as the standard filetype
set ffs=unix,dos,mac

" Turn backup off
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set textwidth=100

set list
set listchars=tab:>-

set ai "Auto indent
set si "Smart indent
set wrap "wrap lines

map <space> /
map <c-space> ?

"Settings for easier splits
set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable Wildmenu
set wildmenu
set wildmode=longest:full,full

set wildignore=*.o,*~,*.pyc,*/.git/*

" Always set the current position
set ruler


" Set transparency
hi Normal guibg=NONE ctermbg=NONE
hi NonText ctermbg=NONE

