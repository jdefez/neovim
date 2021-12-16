lua require('plugins')

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

lua require('basic')

"lua require'navigator'.setup()

" lsp servers
lua <<EOF
require'lspconfig'.intelephense.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.eslint.setup{}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.dotls.setup{}
-- phpactor must be installed glabaly as described here:
--  https://phpactor.readthedocs.io/en/master/usage/standalone.html#installation-global
--  and the path to the executable must be set with
--  vim.g['phpactor_executable'] = '~/phpactor/bin/phpactor'
require'lspconfig'.phpactor.setup{}
EOF

lua require('nvim-cmp')

lua require('lualine-bubble')

lua require('which-key-bindings')

" Mapings

" yank line
nnoremap Y yy$

" copy to clip board
" vmap <C-c> "+y

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

" Specific syntax settings
au BufRead,BufNewFile *.blade.php set ft=html

autocmd Filetype vue setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype html setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype graphql setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype python setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype apache setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

" plugin: phpactor

" avoiding phpactor to create variables with 2 $ sign
autocmd FileType php set iskeyword+=$

" abbreviations
:autocmd FileType php iabbrev <buffer> tm@ /** @test */<CR>public function Name ()<CR><ESC>i{<CR>}<ESC>02k/Name<CR>ciw
