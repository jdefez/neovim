lua require('basic')

lua require('plugins')

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

lua require('lsp-servers')

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

augroup PhpactorMappings
  au!
  au FileType php nmap <buffer> <Leader>mm :PhpactorContextMenu<CR>
  au FileType php nmap <buffer> <Leader>tt :PhpactorTransform<CR>
  "au FileType php nmap <buffer> <Leader>u :PhpactorImportClass<CR>
  "au FileType php nmap <buffer> <Leader>e :PhpactorClassExpand<CR>
  " au FileType php nmap <buffer> <Leader>ua :PhpactorImportMissingClasses<CR>
  " au FileType php nmap <buffer> <Leader>nn :PhpactorNavigate<CR>
  " au FileType php,cucumber nmap <buffer> <Leader>o :PhpactorGotoDefinition edit<CR>
  " au FileType php nmap <buffer> <Leader>K :PhpactorHover<CR>
  "au FileType php nmap <buffer> <Leader>cc :PhpactorClassNew<CR>
  "au FileType php nmap <buffer> <Leader>ci :PhpactorClassInflect<CR>
  "au FileType php nmap <buffer> <Leader>fr :PhpactorFindReferences<CR>
  "au FileType php nmap <buffer> <Leader>mf :PhpactorMoveFile<CR>
  "au FileType php nmap <buffer> <Leader>cf :PhpactorCopyFile<CR>
  "au FileType php nmap <buffer> <silent> <Leader>ee :PhpactorExtractExpression<CR>
  au FileType php vmap <buffer> <silent> <Leader>ee :<C-u>PhpactorExtractExpression<CR>
  au FileType php vmap <buffer> <silent> <Leader>em :<C-u>PhpactorExtractMethod<CR>
augroup END

autocmd FileType php setlocal omnifunc=phpactor#Complete

" abbreviations
:autocmd FileType php iabbrev <buffer> tm@ /** @test */<CR>public function Name ()<CR><ESC>i{<CR>}<ESC>02k/Name<CR>ciw
