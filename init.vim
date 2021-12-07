" todo: note about packer installation:
" git clone --depth 1 https://github.com/wbthomason/packer.nvim\ 
" ~/.local/share/nvim/site/pack/packer/start/packer.nvim

" phpactor lsp integration
"
" https://github.com/bmewburn/vscode-intelephense/issues/1888
" https://phpactor.readthedocs.io/en/master/lsp/code-actions.html

lua require('plugins')

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

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

lua require('galaxy-line')

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

" abbreviations
:autocmd FileType php iabbrev <buffer> tm@ /** @test */<CR>public function Name ()<CR><ESC>i{<CR>}<ESC>02k/Name<CR>ciw
