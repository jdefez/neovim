" todo: note about packer installation:
" git clone --depth 1 https://github.com/wbthomason/packer.nvim\ 
" ~/.local/share/nvim/site/pack/packer/start/packer.nvim

" phpactor lsp integration with actions
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

lua require('lsp-saga')

" lsp servers
lua <<EOF
require'lspconfig'.intelephense.setup{
  settings = {
    path = '/usr/lib/node_modules/intelephense',
    intelephense = {
      licenceKey = '/home/jean/intelephense/licence.txt',
      rules = '@PSR12,ordered_imports,no_unused_imports',
    }
  }
}
require'lspconfig'.phpactor.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.eslint.setup{}
require'lspconfig'.jsonls.setup{}
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

" avoiding phpactor to create variables with 2 $ sign
autocmd FileType php set iskeyword+=$

autocmd Filetype vue setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype html setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype graphql setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype python setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype apache setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

" plugin: telescope
nnoremap <leader>F <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>G <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>h <cmd>lua require('telescope.builtin').help_tags()<cr>

" plugin: lspsaga
" lsp provider to find the cursor word definition and reference
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

" code action
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>

" show hover doc
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>

" scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>

" scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

" show signature help
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>

" rename
" close rename win use <C-c> in insert mode or `q` in noremal mode or `:q`
nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>

" preview definition
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>

" show
nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>

" plugin: phpactor

autocmd FileType php setlocal omnifunc=phpactor#Complete
let g:phpactor_executable = '~/.local/share/nvim/site/pack/packer/phpactor/bin/phpactor'
augroup PhpactorMappings
  au!
  au FileType php nmap <buffer> <Leader>mm :PhpactorContextMenu<CR>
  au FileType php nmap <buffer> <Leader>tt :PhpactorTransform<CR>
augroup END

" only show diagnostic if cursor is over the area
" nnoremap <silent><leader>cc <cmd>lua
" require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>

" jump diagnostic
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>

" abbreviations
:autocmd FileType php iabbrev <buffer> tm@ /** @test */<CR>public function Name ()<CR><ESC>i{<CR>}<ESC>02k/Name<CR>ciw
