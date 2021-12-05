lua require('plug')

lua require('basic')

lua require('schemes')

lua require('tree-sitter')

" lsp servers
lua <<EOF
require'lspconfig'.intelephense.setup{}
require'lspconfig'.phpactor.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.eslint.setup{}
EOF

lua require('nvim-cmp')

" Mapings

" yank line
nnoremap Y yy$

" custom escape
inoremap jj <ESC>

" split navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" move line(s)
nnoremap <S-Up> :m .-2<CR>==
nnoremap <S-Down> :m .+1<CR>==
vnoremap <S-Up> :m '<-2<CR>gv=gv
vnoremap <S-Down> :m '>+1<CR>gv=gv

" copy to clip board
vmap <C-c> "+y

" Specific syntax settings
au BufRead,BufNewFile *.blade.php set ft=html

autocmd Filetype vue setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype html setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype graphql setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype python setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype apache setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

" plugin: telescope
nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>h <cmd>lua require('telescope.builtin').help_tags()<cr>

" plugin: airline
let g:airline_powerline_fonts = 1

" abbreviations
:autocmd FileType php iabbrev <buffer> tmet@ /** @test */<CR>public function Name ()<CR><ESC>i{<CR>}<ESC>02k/Name<CR>ciw
