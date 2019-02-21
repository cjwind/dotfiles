" encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,latin1
set fileencoding=utf-8
set termencoding=utf-8

" coor scheme
"colorscheme koehler			
colorscheme elflord
"colorscheme wombat256

set number
set ai					" auto indent
syntax on
"set noeb				" turn off error bell
"set vb t_vb= 			" turn off visual bell
set expandtab           " replace tab with spaces
set tabstop=4
set shiftwidth=4			" # of space
set softtabstop=4 
"set nobackup
set t_Co=256				" 256 color 
set textwidth=0
"set wrap
set hlsearch
set cursorline
highlight CursorLine cterm=NONE ctermbg=237

hi DiffText   cterm=none ctermfg=Black ctermbg=Red gui=none guifg=Black guibg=Red
hi DiffChange cterm=none ctermfg=Black ctermbg=LightMagenta gui=none guifg=Black guibg=LightMagenta

" fold
set foldmethod=indent
set foldlevel=10

" taglist setting
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"let Tlist_Auto_Open = 1
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
" map F8 to open and close tag list
nnoremap <silent> <F8> :TlistToggle<CR>

" switch tab key map
nmap <C-N> :tabnew<cr> 
nmap <C-K> :tabnext<cr> 
nmap <C-H> :tabprevious<cr>
nmap <C-Y> :tabedit

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
call plug#end()
