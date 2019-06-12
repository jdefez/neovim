call plug#begin('~/.local/share/nvim/plugged')
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'cormacrelf/vim-colors-github'
Plug 'VonHeikemen/rubber-themes.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-obsession'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet'
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'jreybert/vimagit'
Plug 'mattn/emmet-vim'
"Plug 'joonty/vdebug'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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
set foldlevelstart=1
set foldnestmax=3
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
"set splitright
set tabstop=2
set undolevels=10000
set updatetime=300
"set wildmode=longest,list:full

" Change vertical split character to be a space (essentially hide it)
set fillchars+=vert:.
hi! VertSplit gui=NONE guifg=#17252c guibg=#17252c
hi! EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=#17252c guifg=#17252c

" Loop through denite options and enable them
function! s:profile(opts) abort
	for l:fname in keys(a:opts)
		for l:dopt in keys(a:opts[l:fname])
			call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
		endfor
	endfor
endfunction

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

"githug colorscheme
"let g:github_colors_soft = 0
"let g:github_colors_block_diffmark = 0

set termguicolors
colorscheme rubber

" Mapings
inoremap jj <ESC>

" Open tag files
"map T <C-]>

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

" Specific syntax settings
au BufRead,BufNewFile *.ts        set ft=typescript
au BufRead,BufNewFile *.snippets  set ft=snippets
au BufRead,BufNewFile *.twig      set ft=html
au BufRead,BufNewFile *.blade.php set ft=html

autocmd Filetype html setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype snippets setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype python setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype apache setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

" Ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Fugitive **conflicting with coc symbol navigation**
"nnoremap <leader>gd :Gvdiff<CR>
"nnoremap gdh :diffget //2<CR>
"nnoremap gdl :diffget //3<CR>
" TODO: Jumping to the next git hunk (or conflict to fix) can be done with [c
" to backward or ]c to search forward

" vim-markdown-preview
let vim_markdown_preview_github=1

" Vdebug
"let g:vdebug_options= {
"\    "port" : 9000,
"\    "server" : '',
"\    "timeout" : 20,
"\    "on_close" : 'detach',
"\    "break_on_open" : 0,
"\    "ide_key" : '',
"\    "path_maps" : {
"\       "/var/www/manager" : "/var/www/manager",
"\       "/var/www/php-test" : "/var/www/php-test",
"\       "/var/www/gateway.previsite.net" : "/var/www/gateway",
"\       "/var/www/api.my.previsite.com" : "/var/www/my-api"
    "\},
"\    "debug_window_level" : 0,
"\    "debug_file_level" : 0,
"\    "debug_file" : "",
"\    "watch_window_style" : 'compact',
"\    "marker_default"     : '⬦',
"\    "marker_closed_tree" : '▸',
"\    "marker_open_tree" : '▾'
"\}

" Denite
" reset 50% winheight on window resize
augroup deniteresize
  autocmd!
  autocmd VimResized,VimEnter * call denite#custom#option('default',
        \'winheight', winheight(0) / 2)
augroup end

autocmd FileType denite call s:denite_my_settings()

function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q denite#do_map('quit')
  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
endfunction

let s:denite_options = {'default' : {
\ 'auto_resize': 1,
\ 'prompt': 'λ:',
\ 'direction': 'rightbelow',
\ 'winminheight': '10',
\ 'highlight_mode_insert': 'Visual',
\ 'highlight_mode_normal': 'Visual',
\ 'prompt_highlight': 'Function',
\ 'highlight_matched_char': 'Function',
\ 'highlight_matched_range': 'Normal'
\ }}
call s:profile(s:denite_options)

" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>
nnoremap <leader>f :<C-u>Denite grep:.<CR>

"nmap <leader>b :Denite buffer -split=floating -winrow=1<CR>
"nmap <leader>f :Denite file/rec -split=floating -winrow=1<CR>
"nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
"nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>

"autocmd FileType denite call s:denite_my_settings()
"function! s:denite_my_settings() abort
  "nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
  "\ denite#do_map('do_action')
  "nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>
  "\ denite#do_map('do_action')
"endfunction

" Coc
let g:coc_global_extensions = [
\  'coc-lists', 'coc-tag', 'coc-css', 'coc-json', 'coc-phpls',
\  'coc-python', 'coc-yaml', 'coc-eslint', 'coc-tsserver', 'coc-angular'
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

nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gy <Plug>(coc-type-definition)

nmap <leader>rn <Plug>(coc-rename)
vmap <leader>F <Plug>(coc-format-selected)
nmap <leader>F <Plug>(coc-format-selected)
nnoremap <leader> K :call <SID>show_documentation()<CR>

" fzf
nnoremap <silent> <Leader>L :BLines<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>f :Files<CR>

" fzf_action
" ctrl-t tab split
" ctrl-x split
" ctrl-v vsplit

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

" Make background transparent for many things
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
hi! LineNr ctermfg=NONE guibg=NONE
hi! SignColumn ctermfg=NONE guibg=NONE
hi! StatusLine guifg=#16252b guibg=#6699CC
hi! StatusLineNC guifg=#16252b guibg=#16252b

" Try to hide vertical spit and end of buffer symbol
hi! VertSplit gui=NONE guifg=#ffffff guibg=#ffffff
hi! EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=#ffffff guifg=#ffffff

let g:python_host_prog='/usr/local/bin/python2'
let g:python3_host_prog='/usr/local/bin/python3'

