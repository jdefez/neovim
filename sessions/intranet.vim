let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Documents/Github/intranet
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +18 src/app/resources/views/customer-edit.component.html
badd +1 src/app/com/base.component.ts
badd +169 src/app/com/customer-edit.component.ts
badd +29 src/app/com/section-header.component.ts
badd +11 src/app/com/addresses/addresses.component.html
argglobal
silent! argdel *
edit src/app/resources/views/customer-edit.component.html
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
setlocal fdl=8
setlocal fml=1
setlocal fdn=20
setlocal fen
2
normal! zo
14
normal! zo
16
normal! zo
21
normal! zo
22
normal! zo
28
normal! zo
32
normal! zo
44
normal! zo
50
normal! zo
61
normal! zo
67
normal! zo
78
normal! zo
84
normal! zo
95
normal! zo
101
normal! zo
112
normal! zo
118
normal! zo
134
normal! zo
135
normal! zo
let s:l = 203 - ((49 * winheight(0) + 25) / 50)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
203
normal! 0
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToO
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
