let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Documents/Github/facebook/2014
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +8 templates/previsite/contact.html
badd +60 include/controllers/send_email.php
badd +79 include/function_display.php
badd +58 index.php
badd +245 ~/Documents/Github/facebook/include/PrevDB_Facebook.php
argglobal
silent! argdel *
edit include/function_display.php
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
setlocal fdl=18
setlocal fml=1
setlocal fdn=20
setlocal fen
3
normal! zo
6
normal! zo
36
normal! zo
40
normal! zo
42
normal! zo
51
normal! zo
65
normal! zo
74
normal! zo
75
normal! zo
91
normal! zo
129
normal! zo
130
normal! zo
131
normal! zo
139
normal! zo
143
normal! zo
153
normal! zo
165
normal! zo
177
normal! zo
187
normal! zo
let s:l = 77 - ((28 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
77
normal! 033|
lcd ~/Documents/Github/facebook/2014
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOc
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
