" 設定編碼
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,latin1
set fileencoding=utf-8
set termencoding=utf-8

set number				" 行號
"let html_use_css=1
"colorscheme koehler			
colorscheme elflord
"colorscheme wombat256
set ai					" 自動縮排
syntax on				" 色彩標示
"set noeb				" turn off error bell
"set vb t_vb= 				" turn off visual bell
"set tabstop=4
"set shiftwidth=4			" 縮排空白數
"set softtabstop=4 
"set nobackup				" 不要備份檔
set cursorline				" 該行的線
set t_Co=256				" 支援 256 色
set textwidth=0
"set wrap
highlight CursorLine cterm=NONE ctermbg=237

" taglist setting
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"let Tlist_Auto_Open = 1		" 讓 Tlist 自動開啟
let Tlist_Show_One_File = 1         	" 不同時顯示多個文件的tag，只顯示當前文件的
let Tlist_Exit_OnlyWindow = 1           " 如果taglist窗口是最後一個窗口，則退出vim
let Tlist_Use_Right_Window = 1          " 在右側窗口中顯示taglist窗口 
nnoremap <silent> <F8> :TlistToggle<CR>	" F8 為開啟/關閉 Tlist 的快速鍵

" winManager setting
let g:winManagerWindowLayout = "FileExplorer|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
let g:persistentBehaviour = 0		" 所有檔案關閉時自動離開 vim
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
nmap <F12> :WMToggle<cr> 		" F12 為開啟/關閉 winmannager

" tab 切換
nmap <C-N> :tabnew<cr>                  " 增加檔案
nmap <C-K> :tabnext<cr> 
nmap <C-H> :tabprevious<cr>
nmap <C-Y> :tabedit

" 折疊
set foldmethod=indent
set foldlevel=5				" 顯示五層


