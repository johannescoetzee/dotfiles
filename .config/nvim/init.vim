" Vim-Plug stuff
call plug#begin('~/.config/nvim/plugged')

Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Syntastic Configuration
let g:syntastic_python_checkers = ['python', 'mypy']

" Airline Configuration
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Vimtex Configuration
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
" set conceallevel=1
" let g:tex_conceal='abdmg'

" Ultisnips configuration
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

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
set noshowmode
