let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Downloads/programming/gcc_optimizer
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +91 clang_wrapper.py
badd +0 gcc_wrapper.py
argglobal
%argdel
$argadd clang_wrapper.py
edit clang_wrapper.py
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 141 + 141) / 283)
exe 'vert 2resize ' . ((&columns * 141 + 141) / 283)
argglobal
setlocal fdm=indent
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
10
normal! zo
21
normal! zo
21
normal! zo
26
normal! zo
29
normal! zo
31
normal! zo
38
normal! zo
39
normal! zo
42
normal! zo
45
normal! zo
43
normal! zo
47
normal! zo
54
normal! zo
56
normal! zo
62
normal! zo
70
normal! zo
71
normal! zo
75
normal! zo
79
normal! zo
87
normal! zo
94
normal! zo
95
normal! zo
98
normal! zo
let s:l = 98 - ((58 * winheight(0) + 30) / 60)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 98
normal! 020|
wincmd w
argglobal
if bufexists(fnamemodify("gcc_wrapper.py", ":p")) | buffer gcc_wrapper.py | else | edit gcc_wrapper.py | endif
if &buftype ==# 'terminal'
  silent file gcc_wrapper.py
endif
balt clang_wrapper.py
setlocal fdm=indent
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
169
normal! zo
177
normal! zo
177
normal! zo
182
normal! zo
184
normal! zo
201
normal! zo
209
normal! zo
247
normal! zo
let s:l = 247 - ((64 * winheight(0) + 30) / 60)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 247
normal! 07|
wincmd w
exe 'vert 1resize ' . ((&columns * 141 + 141) / 283)
exe 'vert 2resize ' . ((&columns * 141 + 141) / 283)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
