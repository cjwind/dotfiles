" 設定編碼
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,latin1
set fileencoding=utf-8
set termencoding=utf-8

"let html_use_css=1
"colorscheme koehler			
colorscheme elflord
"colorscheme wombat256

set number
set ai					" 自動縮排
syntax on				" 色彩標示
"set noeb				" turn off error bell
"set vb t_vb= 				" turn off visual bell
set expandtab              " replace tab with spaces
set tabstop=4
set shiftwidth=4			" 縮排空白數
set softtabstop=4 
"set nobackup
set cursorline
set t_Co=256				" 支援 256 色
set textwidth=0
"set wrap
set hlsearch
highlight CursorLine cterm=NONE ctermbg=237

" taglist setting
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"let Tlist_Auto_Open = 1		" 讓 Tlist 自動開啟
let Tlist_Show_One_File = 1         	" 不同時顯示多個文件的tag，只顯示當前文件的
let Tlist_Exit_OnlyWindow = 1           " 如果taglist窗口是最後一個窗口，則退出vim
let Tlist_Use_Right_Window = 1          " 在右側窗口中顯示taglist窗口 
nnoremap <silent> <F8> :TlistToggle<CR>	" F8 為開啟/關閉 Tlist 的快速鍵

" tab 切換
nmap <C-N> :tabnew<cr> 
nmap <C-K> :tabnext<cr> 
nmap <C-H> :tabprevious<cr>
nmap <C-Y> :tabedit

" 折疊
"set foldmethod=indent
"set foldlevel=5				" 顯示五層
