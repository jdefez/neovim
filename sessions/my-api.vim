let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Documents/Github/my-api
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1385 app/Repositories/Listing/PrevisiteListingRepository.php
badd +103 app/Http/Controllers/Api/SitesmandatsController.php
badd +10 app/Repositories/Sitesmandats/SitesmandatsRepository.php
badd +56 app/Repositories/Listing/ListingRepository.php
argglobal
silent! argdel *
edit app/Repositories/Listing/PrevisiteListingRepository.php
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winminwidth=1 winheight=1 winwidth=1
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=20
setlocal fen
430
normal! zo
790
normal! zo
794
normal! zo
796
normal! zo
799
normal! zo
802
normal! zo
804
normal! zo
813
normal! zo
817
normal! zo
825
normal! zo
834
normal! zo
996
normal! zo
1334
normal! zo
1387
normal! zo
1392
normal! zo
1394
normal! zo
1397
normal! zo
1398
normal! zo
1399
normal! zo
1402
normal! zo
1410
normal! zo
let s:l = 1387 - ((53 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1387
normal! 0
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOF
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
let g:this_obsession_status = 2
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
