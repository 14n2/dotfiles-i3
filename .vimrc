" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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

"""""""""""""""""""""""""""""""""""
" vim-sensible
" - https://github.com/tpope/vim-sensible
Plug 'tpope/vim-sensible'
"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
" vim-multiple-cursors
Plug 'terryma/vim-multiple-cursors'
"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
" youcompleteme
Plug 'valloric/youcompleteme'
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/youcompleteme/third_party/ycmd/.ycm_extra_conf.py'
nmap <leader>D <plug>(YCMHover)
let g:ycm_autoclose_preview_window_after_insertion = 1
"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
" nerd commenter
Plug 'scrooloose/nerdcommenter' " Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
" a class outline viewer for vim
Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
" vim-autoformat
" https://github.com/Chiel92/vim-autoformat
Plug 'Chiel92/vim-autoformat'
noremap <F3> :Autoformat<CR>
"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
" The NERDTree
" https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror
"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
" vim-airline
" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
" vim-airline-themes
" https://github.com/vim-airline/vim-airline-themes#vim-airline-themes--
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" Smarter tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
" vim.cpp - additional vim c++ syntax highlighting
Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
" onedark.vim
Plug 'joshdick/onedark.vim'
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
"vim-polyglot
Plug 'sheerun/vim-polyglot'
"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
" vim-better-whitespace
Plug 'ntpeters/vim-better-whitespace'
let g:better_whitespace_guicolor='black'
nnoremap ]w :NextTrailingWhitespace<CR>
nnoremap [w :PrevTrailingWhitespace<CR>
"""""""""""""""""""""""""""""""""""

" Initialize plugin system
" Automatically executes filetype plugin indent on and syntax enable.
call plug#end()
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

colorscheme onedark

" Set the minimal amount of lignes under and above the cursor
" Useful for keeping context when moving with j/k
set scrolloff=2

" Show current mode
set showmode

" Show command being executed
set showcmd

" Show line number
set number

" Color the column after textwidth, usually the 80th
let &colorcolumn=join(range(81,999),",")

" Enable line wrapping
set wrap

" Highlight current line
set cursorline

" Allow mouse use in vim
set mouse=a

" Display whitespace characters
set list
set listchars=tab:>\ ,trail:•,extends:>,precedes:<,nbsp:+,eol:

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

" Tab navigation in vim style
"nnoremap tk  :tabfirst<CR>
"nnoremap tj  :tablast<CR>
"nnoremap tm  :tabm<Space>
" Alternatively use
nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>
nnoremap tt :tabedit<Space>
nnoremap tn :tabnew<CR>:NERDTreeFocus<CR>
nnoremap td :tabclose<CR>

nnoremap <leader>abd :%bd<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bn :bn<CR>

" Press F4 to toggle highlighting on/off, and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>
