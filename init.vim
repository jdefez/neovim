lua require('plugins')

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

lua require('basic')

set background=light
colorscheme github-colors

"lua require'navigator'.setup()

" lsp servers
lua <<EOF
require'lspconfig'.intelephense.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.eslint.setup{}
require'lspconfig'.dotls.setup{}
-- require'lspconfig'.phpactor.setup{}
EOF

lua require('nvim-cmp')

lua require('lualine-bubble')

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

" avoiding phpactor to create variables with 2 $ sign
autocmd FileType php set iskeyword+=$

autocmd Filetype vue setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype html setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype graphql setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype python setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype apache setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

" plugin: trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" plugin: telescope
nnoremap <leader>F <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>G <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>h <cmd>lua require('telescope.builtin').help_tags()<cr>

" plugin: phpactor

autocmd FileType php setlocal omnifunc=phpactor#Complete
let g:phpactor_executable = '~/.local/share/nvim/site/pack/packer/phpactor/bin/phpactor'
augroup PhpactorMappings
  au!
  au FileType php nmap <buffer> <Leader>mm :PhpactorContextMenu<CR>
  au FileType php nmap <buffer> <Leader>tt :PhpactorTransform<CR>
augroup END

" jump diagnostic
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>

" abbreviations
:autocmd FileType php iabbrev <buffer> tm@ /** @test */<CR>public function Name ()<CR><ESC>i{<CR>}<ESC>02k/Name<CR>ciw
