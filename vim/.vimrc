
set nocompatible              " be iMproved(unsets the compatibility with ancient Vi)
filetype off                  " required (for Vundle)

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

                                         " List of manually added plugins
Plugin 'airblade/vim-gitgutter'          " Show git modifications
Plugin 'ap/vim-css-color'                " Preview colors in source-code while editing
Plugin 'bling/vim-airline'               " Status line
Plugin 'dhruvasagar/vim-vinegar'         " Open NERDTree like NETrw with '-' key.
Plugin 'gmarik/Vundle.vim'               " Plug-in manager for vim
Plugin 'godlygeek/tabular'               " Line up texts that match same pattern
Plugin 'kchmck/vim-coffee-script'        " Coffee Script support
Plugin 'kshenoy/vim-signature'           " Place, toggle and dispaly marks
Plugin 'mattn/emmet-vim'                 " Abbreviation expansion(auto-expansion)
Plugin 'Yggdroot/indentLine'             " Visually display indent levels
Plugin 'pangloss/vim-javascript'         " JS syntax highlighting and indentation
Plugin 'ryanoasis/vim-devicons'          " File icons for NERDTree
Plugin 'scrooloose/nerdcommenter'        " AutoCompletion
Plugin 'scrooloose/nerdtree'             " NERDTree
Plugin 'scrooloose/syntastic'            " Syntax checking plugin
Plugin 'terryma/vim-multiple-cursors'    " Multiple cursors
Plugin 'jnurmine/Zenburn'                " zenburn colorscheme
Plugin 'tomasr/molokai'                  " molokai colorscheme
Plugin 'tpope/vim-fugitive'              " Git integration
Plugin 'tpope/vim-rails'                 " Rails support-ish
Plugin 'Valloric/YouCompleteMe'          " AutoCompletion
Plugin 'Xuyuanp/nerdtree-git-plugin'     " Git Integration with NERDTree
Plugin 'ctrlpvim/ctrlp.vim'              " Fuzzy Finder 
Plugin 'will133/vim-dirdiff'             " Diff utility
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
colorscheme zenburn       " set colorscheme
set background=dark

" Highlight characters that go over 80 columns (by drawing a border on the 81st)
if exists('+colorcolumn')
  set colorcolumn=81
  highlight ColorColumn ctermbg=red
else
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
endif

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
" soft wrap conf begins
set wrap
set breakindent showbreak=..
set linebreak
"set foldmethod=indent foldcolumn=2
set nolist  " list disables linebreak
" soft wrap conf ends
set splitbelow            " new (horizonatal) split opens below the current split
set splitright            " new (vertical) vsplit opens right to the current split

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KeyMaps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Note - can't append comments in vim commands like 'nnoremap', 'map', etc

" Replace (Shift+;) with just ;
nnoremap ; :
" Easily goto normal mode by pressing 'jj' instead of <ESC>.
" Apparently 'jj' is very rarely typed in insert mode, and doesn't conflict
" with normal typing.
inoremap jj <ESC>
" Change the default MapLeader key, '\', to ','
let mapleader =","

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l) {{{
" Courtesy: https://github.com/paulirish/dotfiles/blob/master/.vimrc
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" }}}

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
let g:syntastic_check_on_wq = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration for vim-airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1    "Existing buffers listed at top
let g:airline#extensions#branch#enabled = 1     "Fugitive support

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration for Ag:The Silver Searcher
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ag_working_path_mode="r" "always start searching from your project root instead of the cwd

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration for NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd vimenter * NERDTree         "start NERDTree at startup
let NERDTreeShowHidden=1            "show hidden files by default
let g:NERDTreeWinSize = 25          "Fixed NERDTree window size
map <leader>n :NERDTreeToggle<CR>

"view the current buffer in NERDTree
map <leader>r :NERDTreeFind<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration for nerdtree-git-plugin 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:NERDTreeIndicatorMapCustom = {
      "\ "Modified"  : "✹",
      "\ "Staged"    : "✚",
      "\ "Untracked" : "✭",
      "\ "Renamed"   : "➜",
      "\ "Unmerged"  : "═",
      "\ "Deleted"   : "✖",
      "\ "Dirty"     : "✗",
      "\ "Clean"     : "✔︎",
      "\ "Unknown"   : "?"
      "\ }

   
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration for vim-devicons
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encoding must be set to UTF-8 for the glyphs to show
set encoding=utf8
" For Powerline symbols to show in airline the following needs to be set
let g:airline_powerline_fonts = 1
" To get glyphs to show completely in MacVim
" courtesy: https://github.com/ryanoasis/vim-devicons/issues/110
set ambiwidth=double

set guifont=Ubuntu\ Mono\ derivative\ Powerline\ Nerd\ Font\ Complete:h14


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration for buffer maniupluation
" Excerpted from http://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Faster buffer naviation
map ]b :bnext<CR>
map [b :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Notes (by sarojk)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"to get rid of 'no buftype set' error,
":set buftype:
"
"to load updated .vimrc without restarting
":so $MYVIMRC
