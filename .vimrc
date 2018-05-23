" hz is escape
inoremap hz <esc>

inoremap /**<CR> /**<CR><BS><BS>**/<Esc>O<BS> * 

" Automatically do double curly braces
inoremap {<CR> {<CR>}<Esc>O

colorscheme molokai-dark

" Javadoc /**
" Enable filetype plugins
filetype plugin on
filetype indent on

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

" Set transparency
hi Normal guibg=NONE ctermbg=NONE
hi NonText ctermbg=NONE

