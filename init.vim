call plug#begin('~/.local/share/nvim/plugged')
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'scrooloose/nerdcommenter'
Plug 'swekaj/php-foldexpr.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-obsession'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet'
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jreybert/vimagit'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'evanleck/vim-svelte'
Plug 'psliwka/vim-smoothie'

" schemes
Plug 'rakr/vim-one'
Plug 'mhartington/oceanic-next'
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'cormacrelf/vim-colors-github'
Plug 'arzg/vim-colors-xcode'
call plug#end()

let mapleader = "\<Space>"

set autoread
set belloff=all
set cmdheight=3
set colorcolumn=81
set cursorline
set encoding=utf-8
set expandtab
set foldcolumn=0
set foldmethod=indent
"set foldlevelstart=1
"set foldnestmax=3
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
set number relativenumber
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

" Change vertical split character to be a space (essentially hide it)
set fillchars+=vert:.
hi! VertSplit gui=NONE guifg=#17252c guibg=#17252c
hi! EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=#17252c guifg=#17252c

" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" executing a macro over a selection
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" color schemes

set termguicolors

"rakr/vim-one
"colorscheme one
"set background=dark

" mhartington/oceanic-next
"colorscheme OceanicNext

" arcticicestudio/nord-vim
"colorscheme nord

" ayu-theme/ayu-vim
"let ayucolor="mirage"
"let ayucolor="light"
"let ayucolor="dark"
"colorscheme ayu

" palenight
"set background=dark
"colorscheme palenight
"let g:palenight_terminal_italics=1

" monokai_pro
colorscheme monokai_pro

" githug colorscheme
"let g:github_colors_soft = 0
"let g:github_colors_block_diffmark = 0
"colorscheme github

" xcode colorscheme
"augroup vim-colors-xcode
  "autocmd!
"augroup END
"autocmd vim-colors-xcode ColorScheme * hi Comment        cterm=italic gui=italic
"autocmd vim-colors-xcode ColorScheme * hi SpecialComment cterm=italic gui=italic
"colorscheme xcodedark

" Mapings
inoremap jj <ESC>

" Split navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Move line(s)
nnoremap <S-Up> :m .-2<CR>==
nnoremap <S-Down> :m .+1<CR>==
vnoremap <S-Up> :m '<-2<CR>gv=gv
vnoremap <S-Down> :m '>+1<CR>gv=gv

" copy to clip board
vmap <C-c> "+y

" Specific syntax settings
"au BufRead,BufNewFile *.ts        set ft=typescript
au BufRead,BufNewFile *.twig      set ft=html
au BufRead,BufNewFile *.blade.php set ft=html

"autocmd Filetype vue setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
"autocmd Filetype svelte setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
"autocmd Filetype snippets setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
"autocmd Filetype html setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype python setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype apache setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

" Vdebug
" if !exists('g:vdebug_options')
"   let g:vdebug_options = {}
" endif
" let g:vdebug_options.path_maps = {"/var/www/mooveo": "/Users/jean/Documents/VagVagrant/mooveo"}

" vim-smoothie
" let g:smoothie_no_default_mappings = 1

" vim-phpdoc
"nmap <Leader>d :call PhpDocPasteComment()<CR>

" Ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Fugitive **conflicting with coc symbol navigation**
nnoremap <leader>gd :Gvdiff<CR>
nnoremap dgh :diffget //2<CR>
nnoremap dgl :diffget //3<CR>
nnoremap dp :diffput<CR>
nnoremap dg :diffget<CR>

" vim-markdown-preview
let vim_markdown_preview_github=1

" Coc
" Todo: test coc-jest
let g:coc_global_extensions = [
\  'coc-phpls', 'coc-lists', 'coc-tag', 'coc-css', 'coc-json', 'coc-html',
\  'coc-yaml', 'coc-eslint', 'coc-pairs', 'coc-vetur', 'coc-tsserver'
\]

" neo-snippets
inoremap <silent><expr> <TAB>
       \ pumvisible() ? "\<C-n>" :
       \ <SID>check_back_space() ? "\<TAB>" :
       \ coc#refresh()

" Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Map <C-k> as shortcut to activate snippet if available
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Hide conceal markers
let g:neosnippet#enable_conceal_markers = 0

" coc mappings
nnoremap <Leader>a :<C-u>CocList diagnostics<cr>
nnoremap <Leader>l :<C-u>CocList<cr>
nnoremap <Leader>A :<C-u>CocAction<cr>
nnoremap <Leader>C :<C-u>CocCommand<cr>
nnoremap <Leader>S :<C-u>CocSearch <C-R><C-W><CR>

nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gy <Plug>(coc-type-definition)

"nmap <leader>r <Plug>(coc-refactor)
"nmap <leader>R <Plug>(coc-rename)
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
vmap <leader>F <Plug>(coc-format-selected)
nmap <leader>F <Plug>(coc-format-selected)
nnoremap <leader>K :call <SID>show_documentation()<CR>

" Phpactor
let g:phpactor_executable = '~/.local/share/nvim/plugged/phpactor/bin/phpactor'
augroup PhpactorMappings
  au!
  au FileType php nmap <buffer> <Leader>mm :PhpactorContextMenu<CR>
  au FileType php nmap <buffer> <Leader>tt :PhpactorTransform<CR>

  au FileType php nmap <buffer> <Leader>vv :PhpactorChangeVisibility<CR>
  au FileType php nmap <buffer> <Leader>u :PhpactorImportClass<CR>
  au FileType php nmap <buffer> <Leader>e :PhpactorClassExpand<CR>
  au FileType php nmap <buffer> <Leader>ua :PhpactorImportMissingClasses<CR>
  au FileType php nmap <buffer> <Leader>cc :PhpactorClassNew<CR>
  au FileType php nmap <buffer> <Leader>ci :PhpactorClassInflect<CR>
  au FileType php nmap <buffer> <Leader>mf :PhpactorMoveFile<CR>
  au FileType php nmap <buffer> <Leader>cf :PhpactorCopyFile<CR>
  au FileType php nmap <buffer> <Leader>gs :PhpactorGenerateAccessor<CR>
  au FileType php nmap <buffer> <silent> <Leader>ee :PhpactorExtractExpression<CR>
  au FileType php vmap <buffer> <silent> <Leader>ee :<C-u>PhpactorExtractExpression<CR>
  au FileType php vmap <buffer> <silent> <Leader>em :<C-u>PhpactorExtractMethod<CR>
augroup END

" fzf
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit' }
let $FZF_DEFAULT_COMMAND= 'ag -g ""'

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
  \ 'header':  ['fg', 'Comment']}

nnoremap <silent> <Leader>L :BLines<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>j :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>g :Ag <CR>

" php-foldexpr
let b:phpfold_use = 1              " Fold groups of use statements in the global scope.
let b:phpfold_group_iftry = 0      " Fold if/elseif/else and try/catch/finally blocks as a group, rather than each part separate.
let b:phpfold_group_args = 1       " Group function arguments split across multiple lines into their own fold.
let b:phpfold_group_case = 1       " Fold case and default blocks inside switches.
let b:phpfold_heredocs = 1         " Fold HEREDOCs and NOWDOCs.
let b:phpfold_docblocks = 0        " Fold DocBlocks.
let b:phpfold_doc_with_funcs = 0   " Fold DocBlocks. Overrides b:phpfold_docblocks.
let b:phpfold_text = 0             " Enable the custom foldtext option.
let b:phpfold_text_right_lines = 0 " Display the line count on the right instead of the left.
let b:phpfold_text_percent = 0     " Display the percentage of lines the fold represents.

" airline
let g:airline_powerline_fonts = 1

" abbreviations
" find away to load them for a dedicated language
iab puf public function()<Left><Left>
iab psf public static function()<Left><Left>
iab prif private static function()<Left><Left>
iab prof protected static function()<Left><Left>

"let g:python_host_prog='/usr/local/bin/python2'
"let g:python3_host_prog='/Library/Frameworks/Python.framework/Versions/3.7/bin/python3'
