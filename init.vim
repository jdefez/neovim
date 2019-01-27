call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'reedes/vim-colors-pencil'
Plug 'airblade/vim-gitgutter'
Plug 'jsfaint/gen_tags.vim'
Plug 'itchyny/lightline.vim'
Plug 'kshenoy/vim-signature'
Plug 'sheerun/vim-polyglot', { 'do': './build' }
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

"Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'rafaelndev/deoplete-laravel-plugin', {'for': ['php'], 'do': 'composer install'}
"Plug 'zchee/deoplete-jedi'
"Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
"Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' } php7 only
"Plug 'zefei/deoplete-hack'
"Plug 'Shougo/neco-vim'
call plug#end()

let mapleader = "\<Space>"
set belloff=all
set cmdheight=3
set complete=.
set completeopt=menuone,noinsert,noselect  " longest
set colorcolumn=80
set cursorline
set enc=utf-8
set expandtab " converts tabs to spaces
set foldcolumn=0
set foldmethod=indent
set foldnestmax=1 " maximum fold depth
set formatoptions+=c " Autowrap comments using textwidth
set formatoptions+=j " Delete comment character when joining commented lines
set formatoptions+=l " Do not wrap lines that have been longer when starting insert mode already
set formatoptions+=n " Recognize numbered lists
set formatoptions+=q " Allow formatting of comments with "gq".
set formatoptions+=r " Insert comment leader after hitting <Enter>
set formatoptions+=t " Auto-wrap text using textwidth
set history=10000
set hlsearch
set incsearch " search as character are entered
set ignorecase " ignore case when using a search pattern noic|ic
set nowrap " long lines wrap : nowrap|wrap
set number
set pumheight=40
set ruler
set scrolloff=1000 " number of screen lines to show around the cursor
set shiftround
set shiftwidth=2
set showfulltag
set smartcase
set smartindent
set softtabstop=2
set tabstop=2
set undolevels=10000
set wildmode=longest,list:full

colorscheme pencil
set background=dark

" Mapings
inoremap jj <ESC>

" Path found by using:
" which python2
" which python3
let g:python_host_prog  = '/usr/local/bin/python2'
let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.7/bin/python3'

" Open tag files
map T <C-]>

" gen_tags
let g:gen_tags#gtags_default_map=1
"<C+c> Find functions calling this function
"<C+d> Find functions called by this function
"<C+e> Find this egrep pattern
"<C+f> Find this file
"<C+g> Find this definition
"<C+i> Find files #including this file
"<C+s> Find this C symbol
"<C+t> Find this text string

" Buffer navigation
" nnoremap <tab> :bnext<cr>
" nnoremap <S-tab> :bprev<cr>

" Split navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Specific syntax settings
au BufRead,BufNewFile *.ts        set ft=typescript
au BufRead,BufNewFile *.snippets  set ft=snippets
au BufRead,BufNewFile *.twig      set ft=html
au BufRead,BufNewFile *.blade.php set ft=html

" autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype html setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype snippets setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype python setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype apache setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

" Coc
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
let g:coc_snippet_next='<C-n>'
let g:coc_snippet_previous='<C-p>'

" Lightline
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'cocstatus' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \   'cocstatus': 'coc#status'
  \ },
\ }

" Ack -> Ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Doc
  " Resulting quickfix list navigation shortcut
  "
  " ?    a quick summary of these keys, repeat to close
  " o    to open (same as Enter)
  " O    to open and close the quickfix window
  " go   to preview file, open but maintain focus on ack.vim results
  " t    to open in new tab
  " T    to open in new tab without moving to it
  " h    to open in horizontal split
  " H    to open in horizontal split, keeping focus on the results
  " v    to open in vertical split
  " gv   to open in vertical split, keeping focus on the results
  " q    to close the quickfix window

" Fzf
let $FZF_DEFAULT_COMMAND= 'ag -g ""'
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>
nnoremap <silent> <Leader>L :BLines<CR>
nnoremap <silent> <Leader>s :Snippets<CR>
nnoremap <silent> <Leader>t :Tags<CR>
nnoremap <silent> <Leader>T :BTags<CR>

let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Doc
  " https://github.com/junegunn/fzf.vim
  " Files [PATH] 	Files (similar to :FZF)
  " GFiles [OPTS] 	Git files (git ls-files)
  " GFiles? 	    Git files (git status)
  " Buffers 	    Open buffers
  " Colors 	    Color schemes
  " Ag [PATTERN] 	ag search result (ALT-A to select all, ALT-D to deselect all)
  " Lines [QUERY] 	Lines in loaded buffers
  " BLines [QUERY] Lines in the current buffer
  " Tags [QUERY] 	Tags in the project (ctags -R)
  " BTags [QUERY] 	Tags in the current buffer
  " Marks 	        Marks
  " Windows 	    Windows
  " Locate PATTERN locate command output
  " History 	    v:oldfiles and open buffers
  " History: 	    Command history
  " History/ 	    Search history
  " Snippets 	    Snippets (UltiSnips)
  " Commits 	    Git commits (requires fugitive.vim)
  " BCommits 	    Git commits for the current buffer
  " Commands 	    Commands
  " Maps 	        Normal mode mappings
  " Helptags 	    Help tags 1
  " Filetypes 	    File types

" Autotag to be used after exectuing 'ctags -R -f tags.txt *' on the project folder
let g:autotagTagsFile = 'tags'

" Ale
let g:ale_fixers = {
\   'python': ['flake8'],
\}
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_lint_on_text_changed = 'never'

" UltiSnips
set runtimepath+=~/.config/nvim/my-snippets/
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
