source $VIMRUNTIME/vimrc_example.vim
behave mswin

set backupdir=~\.vim\backup
set undodir=~\.vim\undo 

set number
syntax on
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set autoindent


function! DelayScreenClear()
    sleep 100m
    echo ''
endfunction

set ignorecase
"mappings for saving files with F12
map <silent><F12> <ESC>:wa<CR>:echo'SAVED'<CR>:call DelayScreenClear()<CR>
map! <silent><F12> <ESC>:wa<CR>:echo'SAVED'<CR>:call DelayScreenClear()<CR>

"mappings for saving files with C-s
map <silent><C-s> <ESC>:wa<CR>:echo'SAVED'<CR>:call DelayScreenClear()<CR>
map! <silent><C-s> <ESC>:wa<CR>:echo'SAVED'<CR>:call DelayScreenClear()<CR>


"mappings for pasting with C-v
"nmap <C-v> "*p
imap <C-v> <ESC>"*pa

"mappings for copying with C-c
vmap <C-c> "*y

"mappings for closing tab with C-w
"nmap <C-w> :wq<CR>
"imap <C-w> <ESC>:wq<CR>


"mappings for pasting with C-v
nmap <ENTER> i<CR><ESC>


"mappings for opening recently closed tab with C-T (Ctrl + Shift + T)
"nmap <C-T> :tabnew#<CR>
"imap <C-w> <ESC>:wq<CR>

set noerrorbells visualbell t_vb=
colorscheme darkblue
"set showmatch
