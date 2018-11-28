let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Documents/Github/my-api
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +33 routes/api.php
badd +180 app/Repositories/Listing/PrevisiteListingRepository.php
badd +173 app/Http/Controllers/Api/LiveSessionController.php
badd +93 app/Repositories/VirtualVisit/PrevisiteVirtualVisitRepository.php
badd +8 app/Repositories/PrevisiteRepository.php
argglobal
silent! argdel *
edit app/Http/Controllers/Api/LiveSessionController.php
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
setlocal fdl=12
setlocal fml=1
setlocal fdn=20
setlocal fen
22
normal! zo
117
normal! zo
119
normal! zo
136
normal! zo
147
normal! zo
148
normal! zo
162
normal! zo
162
normal! zo
162
normal! zo
175
normal! zo
175
normal! zo
175
normal! zo
185
normal! zo
185
normal! zo
185
normal! zo
215
normal! zo
215
normal! zo
221
normal! zo
231
normal! zo
278
normal! zo
279
normal! zo
294
normal! zo
295
normal! zo
307
normal! zo
348
normal! zo
let s:l = 172 - ((28 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
172
normal! 015|
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
