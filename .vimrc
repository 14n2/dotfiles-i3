""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" +--------------------------------------+
" | vim-plug                             |
" | https://github.com/junegunn/vim-plug |
" +--------------------------------------+
" Install vim-plug if we don't already have it
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist
    execute '!mkdir -p ~/.vim/plugged'
    execute '!mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" vim-sensible
" - https://github.com/tpope/vim-sensible
Plug 'tpope/vim-sensible'

" solorized
" - https://github.com/yiyangzhg/solarized/tree/master/vim-colors-solarized
Plug 'git://github.com/altercation/vim-colors-solarized.git'

" Initialize plugin system
" Automatically executes filetype plugin indent on and syntax enable.
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" solorized color scheme
set background=dark
colorscheme solarized

" Set the minimal amount of lignes under and above the cursor
" Useful for keeping context when moving with j/k
set scrolloff=5

" Show current mode
set showmode

" Show command being executed
set showcmd

" Show line number
set number

" Color the column after textwidth, usually the 80th
set colorcolumn=80

" Enable line wrapping
set wrap

" Highlight current line
set cursorline

" Allow mouse use in vim
set mouse=a

" Display whitespace characters
set list
set listchars=tab:>\ ,trail:•,extends:>,precedes:<,nbsp:+

" Set vertical separators.
" set fillchars=vert:│

" Ignore case on search
set ignorecase

" Ignore case unless there is an uppercase letter in the pattern
set smartcase

" Move cursor to the matched string
set incsearch

" Don't highlight matched strings
set nohlsearch

" The length of a tab
" DO NOT CHANGE the default value of 8, ever.
set tabstop=8

" The number of spaces inserted/removed when using < or >
set shiftwidth=4

" The number of spaces inserted when you press tab.
" -1 means the same value as shiftwidth
set softtabstop=-1

" Insert spaces instead of tabs
set expandtab

" Move between rows in wrapped lines
noremap j gj
noremap k gk
