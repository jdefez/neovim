" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim 
"   \ --create-dirs
"   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

"call plug#begin('~/.nvim/plugged')
"call plug#end()

set autoread
set belloff=all
set cmdheight=3
set colorcolumn=81
set cursorline
set encoding=utf-8
set expandtab
set foldcolumn=0
set foldmethod=indent
set formatoptions+=c " Autowrap comments using textwidth
set formatoptions+=j " Delete comment character when joining commented lines
set formatoptions+=l " Do not wrap lines that have been longer when starting insert mode already
set formatoptions+=n " Recognize numbered lists
set formatoptions+=q " Allow formatting of comments with gq.
set formatoptions+=r " Insert comment leader after hitting <Enter>
set formatoptions+=t " Auto-wrap text using textwidth
set hidden
set history=10000
set hlsearch
set incsearch
set ignorecase
set noerrorbells
set nowrap
set nobackup
set nowritebackup
set number " relativenumber
set pumheight=40
set ruler
set scrolloff=1000 " number of screen lines to show around the cursor
set shiftround
set shiftwidth=0
set shortmess+=c
set showfulltag
set signcolumn=yes
set smartcase
set smartindent
set softtabstop=2
set splitbelow
set tabstop=2
set undolevels=10000
set updatetime=300
