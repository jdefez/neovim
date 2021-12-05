
lua require('plug')

lua require('basic')

lua require('schemes')

lua require('tree-sitter')

" lsp servers
"lua <<EOF
"require'lspconfig'.intelephense.setup{}
"require'lspconfig'.phpactor.setup{}
"EOF

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
"vmap <C-c> "+y

" Specific syntax settings
au BufRead,BufNewFile *.blade.php set ft=html

autocmd Filetype vue setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype html setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype graphql setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype python setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype apache setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

" Ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Fugitive
nnoremap <leader>gd :Gvdiff<CR>
nnoremap dgh :diffget //2<CR>
nnoremap dgl :diffget //3<CR>
nnoremap dp :diffput<CR>
nnoremap dg :diffget<CR>

" plugin:fzf
" todo: setup mappings (https://github.com/junegunn/fzf.vim)
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

" PLUGIN: FZF
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>g :Rg<CR>
nnoremap <silent> <Leader>l :BLines<CR>
"nnoremap <silent> <Leader>' :Marks<CR>
"nnoremap <silent> <Leader>g :Commits<CR>
"nnoremap <silent> <Leader>H :Helptags<CR>
"nnoremap <silent> <Leader>hh :History<CR>
"nnoremap <silent> <Leader>h: :History:<CR>
"nnoremap <silent> <Leader>h/ :History/<CR>

" airline
let g:airline_powerline_fonts = 1

" abbreviations
:autocmd FileType php iabbrev <buffer> tmet@ /** @test */<CR>public function Name ()<CR><ESC>i{<CR>}<ESC>02k/Name<CR>ciw

let g:python3_host_prog='/usr/bin/python3'
