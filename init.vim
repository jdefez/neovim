call plug#begin('~/.local/share/nvim/plugged')
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'cormacrelf/vim-colors-github'

Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim'

"Plug 'reedes/vim-colors-pencil'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'kshenoy/vim-signature'
"Plug 'jsfaint/gen_tags.vim'
"Plug 'sheerun/vim-polyglot', { 'do': './build' }
Plug 'tpope/vim-obsession'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet'
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'jreybert/vimagit'
Plug 'mattn/emmet-vim'
"Plug 'mileszs/ack.vim'
"Plug 'joonty/vdebug'
"Plug 'junegunn/fzf.vim'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'w0rp/ale'
call plug#end()

let mapleader = "\<Space>"
set autoread
set belloff=all
set cmdheight=3
set complete=.
set completeopt=menuone,noinsert,noselect
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
set splitright
set tabstop=2
set undolevels=10000
set updatetime=300
set wildmode=longest,list:full

" githug colorscheme
let g:github_colors_soft = 0
let g:github_colors_block_diffmark = 0

colorscheme github
"set background=dark

" Mapings
inoremap jj <ESC>

" Open tag files
"map T <C-]>

" Split navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Move
nnoremap <S-Up> :m .-2<CR>==
nnoremap <S-Down> :m .+1<CR>==
vnoremap <S-Up> :m '<-2<CR>gv=gv
vnoremap <S-Down> :m '>+1<CR>gv=gv

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

" Fugitive
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

"TODO: Jumping to the next git hunk (or conflict to fix) can be done with [c
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

" gen_tags
"let g:gen_tags#gtags_default_map=1
"<C+c> Find functions calling this function
"<C+d> Find functions called by this function
"<C+e> Find this egrep pattern
"<C+f> Find this file
"<C+g> Find this definition
"<C+i> Find files #including this file
"<C+s> Find this C symbol
"<C+t> Find this text string

" Denite
" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob (aka ignore .git files)

call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight

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

" Loop through denite options and enable them
function! s:profile(opts) abort
	for l:fname in keys(a:opts)
		for l:dopt in keys(a:opts[l:fname])
			call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
		endfor
	endfor
endfunction

call s:profile(s:denite_options)

" Coc
let g:coc_global_extensions = [
\  'coc-lists', 'coc-tag', 'coc-css', 'coc-json', 'coc-phpls',
\  'coc-python', 'coc-yaml', 'coc-tslint', 'coc-tsserver', 'coc-tslint-plugin'
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

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

nnoremap <silent> K :call <SID>show_documentation()<CR>
autocmd CursorHold * silent call CocActionAsync('highlight')

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
"if executable('ag')
  "let g:ackprg = 'ag --vimgrep'
"endif

" Fzf
"let $FZF_DEFAULT_COMMAND= 'ag -g ""'
"nnoremap <silent> <Leader>f :Files<CR>
"nnoremap <silent> <Leader>b :Buffers<CR>
"nnoremap <silent> <Leader>l :Lines<CR>
"nnoremap <silent> <Leader>L :BLines<CR>
"nnoremap <silent> <Leader>s :Snippets<CR>
"nnoremap <silent> <Leader>t :Tags<CR>
"nnoremap <silent> <Leader>T :BTags<CR>

"let g:fzf_colors = {
  "\ 'fg':      ['fg', 'Normal'],
  "\ 'bg':      ['bg', 'Normal'],
  "\ 'hl':      ['fg', 'Comment'],
  "\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  "\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  "\ 'hl+':     ['fg', 'Statement'],
  "\ 'info':    ['fg', 'PreProc'],
  "\ 'border':  ['fg', 'Ignore'],
  "\ 'prompt':  ['fg', 'Conditional'],
  "\ 'pointer': ['fg', 'Exception'],
  "\ 'marker':  ['fg', 'Keyword'],
  "\ 'spinner': ['fg', 'Label'],
  "\ 'header':  ['fg', 'Comment'] }

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
" let g:autotagTagsFile = 'tags'

" Ale
"let g:ale_fixers = {
"\   'python': ['flake8'],
"\}
"let g:ale_sign_error = '>>'
"let g:ale_sign_warning = '--'
"let g:ale_lint_on_text_changed = 'never'

" UltiSnips
"set runtimepath+=~/.config/nvim/my-snippets/
"let g:UltiSnipsExpandTrigger="<c-e>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsEditSplit="vertical"

