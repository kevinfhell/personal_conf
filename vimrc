colorscheme desert
au BufRead,BufNewFile *.fpl            set filetype=fpl
au BufRead,BufNewFile *.asl            set filetype=asl
au BufRead,BufNewFile *.sdl            set filetype=sdl
set tabstop=4
set shiftwidth=4
autocmd FileType c,cpp,hpp,h set shiftwidth=4 | set expandtab
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 40
map <F4> :TlistToggle<cr>

