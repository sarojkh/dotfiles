    
set nocompatible              " be iMproved(unsets the compatibility with ancient Vi)
filetype off                  " required (for Vundle)

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" List of manually added plugins
Plugin 'jnurmine/Zenburn'       "zenburn colorscheme
Plugin 'tomasr/molokai'         "molokai colorscheme
Plugin 'kien/ctrlp.vim'         "CtrlP FuzzyFinder
Plugin 'vim-scripts/ZoomWin'    "Set full-width to current split
Plugin 'scrooloose/syntastic'   "Syntax checking plugin
Plugin 'vim-scripts/tComment'   "Toggle comment
Plugin 'bling/vim-airline'      "Status line
Plugin 'tpope/vim-fugitive'     "Git integration
Plugin 'scrooloose/nerdtree'    "NERDTree
Plugin 'dhruvasagar/vim-vinegar' "Open NERDTree like NETrw with '-' key. 
Plugin 'terryma/vim-multiple-cursors' "Multiple cursors
Plugin 'mattn/emmet-vim'        "Abbreviation expansion(auto-expansion)
Plugin 'nathanaelkane/vim-indent-guides' "Visually display indent levels
Plugin 'godlygeek/tabular'      "Line up texts that match same pattern

" Keep Plugin commands between vundle#begin/end.

" All of your Plugins must be added before the following line
call vundle#end()            " required                                 
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" Put your non-Plugin stuff after this line


" Majority of the following config was extracted from 
" https://github.com/michaeljsmalley/dotfiles/blob/master/vimrc
" However, there are small additions and modifications here and there.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
colorscheme molokai       " set colorscheme
set guifont=Monaco:h14    " set font for MacVIM. vim in terminal uses terminal font

" Highlight characters that go over 80 columns (by drawing a border on the 81st)
if exists('+colorcolumn')
  set colorcolumn=81
  highlight ColorColumn ctermbg=red
else
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Netrw Explorer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:netrw_liststyle=3   " open Netrw in Tree mode by default

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set relativenumber        " show relative line numbers
set number                " show line numbers
set numberwidth=6         " make the number gutter 6 characters wide
"set cul                   " highlight current line
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set showmatch             " Show Matching Parenthesis
set visualbell            " Don't beep; flash the screen instead.
let g:indent_guides_enable_on_vim_startup = 1 "Start indent_guide at startup

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent            " auto-indent
set tabstop=2             " tab is 2 spaces
set softtabstop=2         " unify       
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smartindent           " automatically insert one extra level of indentation
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
set splitbelow            " new (horizonatal) split opens below the current split
set splitright            " new (vertical) vsplit opens right to the current split

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KeyMaps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Note - can't append comments in vim commands like 'nnoremap', 'map', etc

" Replace (Ctrl+;) with just ; 
nnoremap ; :
" Easily goto normal mode by pressing 'jj' instead of <ESC>.
" Apparently 'jj' is very rarely typed in insert mode, and doesn't confilict
" with normal typing.
inoremap jj <ESC>
" Change the default MapLeader key, '\', to ','
let mapleader =","
" Map 'E' to 'Explore'- Netrw's command
" courtesy:
" http://stackoverflow.com/questions/14367440/map-e-to-explore-in-command-mode
command! -nargs=* -bar -bang -count=0 -complete=dir E Explore <args>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Window Size 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
else
  " This is console Vim.
  " if exists("+lines")
  "   set lines=25
  " endif
  " if exists("+columns")
  "   set columns=80
  " endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Management of swap, backup and undo files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Note : Creation of the following folder needs to be done manually
" courtesy:
" http://stackoverflow.com/questions/821902/disabling-swap-files-creation-in-vim
set backupdir=~/.vim/backup//     " backup files have tilde. eg: abc.txt~
set directory=~/.vim/swap//       " swap files have *.swp extension
set undodir=~/.vim/undo//

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic plugin recommended settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Note : Settings for newbies.
" courtesy:
" https://github.com/scrooloose/syntastic#settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration for vim-airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1    "Existing buffers listed at top
let g:airline#extensions#branch#enabled = 1     "Fugitive support

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration for NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd vimenter * NERDTree         "start NERDTree at startup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Notes (by sarojk)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"to get rid of 'no buftype set' error, 
":set buftype:
"
"to load updated .vimrc without restarting
":so $MYVIMRC
