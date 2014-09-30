" ******************************************************************************************** "
" VIM personal configure
" ******************************************************************************************** "

" ******************************************************************************************** "
" ==> VIM Base Configure
" ******************************************************************************************** "

" ******************************************************************************************** "
" ===> VIM General Configure
" ******************************************************************************************** "

syntax on							" 语法高亮

filetype on							" 侦测文件类型

set showcmd							" 在状态栏显示正在输入的命令

set number							" 显示行号

set cul 							"高亮光标所在行
set cuc

" filetype plugin on						" 载入文件类型插件
" filetype indent on
 
" NoMatchParen							"关闭/打开配对括号高亮
" DoMatchParen

set history=1000						" 历史记录数

set nocompatible						" 不要使用vi的键盘模式，而是vim自己的

set noeb							" 去掉输入错误的提示声音

autocmd! bufwritepost vimrc source ~/.vimrc			" When vimrc is edited, reload it

" ******************************************************************************************** "
" ===> VIM user interface
" ******************************************************************************************** "

set completeopt=preview,menu 					"代码补全 

set shortmess=atI						" 启动的时候不显示那个援助乌干达儿童的提示  

set go=      							" 不要图形按钮  

"set whichwrap+=<,>,h,l     					" 允许backspace和光标键跨越行边界(不建议)   

set scrolloff=3  						" 光标移动到buffer的顶部和底部时保持3行距离 

" set laststatus=1   						" 启动显示状态行(1),总是显示状态行(2) 

" set foldenable  						" 允许折叠 

" set foldmethod=manual   					" 手动折叠      

set nocompatible  						"去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限    

set viminfo+=!							" 保存全局变量

set iskeyword+=_,$,@,%,#,-					" 带有如下符号的单词不要被换行分割

"set cursorline							" 突出显示当前行

set magic                   					" 设置魔术

set guioptions-=T           					" 隐藏工具栏

set guioptions-=m           					" 隐藏菜单栏
" set foldcolumn=0
" set foldmethod=indent 
" set foldlevel=3 

set ignorecase							" 搜索忽略大小写

set wildmenu							" 增强模式中的命令行自动完成操作

set report=0							" 通过使用: commands命令，告诉我们文件的哪一行被改变过

set fillchars=vert:\ ,stl:\ ,stlnc:\				" 在被分割的窗口间显示空白，便于阅读

set cmdheight=2							" 总是显示状态行

set hlsearch							"搜索逐字符高亮


" ******************************************************************************************** "
" ===> Colors and Fonts
" ******************************************************************************************** "

color ron							" 设置背景主题 
" colorscheme desert      					" gvim

"set guifont=Courier_New:h10:cANSI    				" 设置字体

"autocmd InsertLeave * se nocul    				" 用浅色高亮当前行 

autocmd InsertEnter * se cul    				" 用浅色高亮当前行

set ruler       						" 显示标尺

" ******************************************************************************************** "
" ===> Files, backups and undo
" ******************************************************************************************** "

set confirm							" 在处理未保存或只读文件的时候，弹出确认

set nobackup							" 禁止生成临时文件
set noswapfile
set nowb

set autowrite							"自动保存

" ******************************************************************************************** "
" ===> Statusline configure
" ******************************************************************************************** "

" Always hide the statusline
set laststatus=2

" Format the statusline
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}     "状态行显示的内容    
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

" ******************************************************************************************** "
" ===> Text, tab and indent related
" ******************************************************************************************** "

set backspace=2							" 使回格键（backspace）正常处理indent, eol, start等

nmap tt :%s/\t/    /g<CR>					"将tab替换为空格

set mouse=a							" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set selection=exclusive
set selectmode=mouse,key

set showmatch							" 高亮显示匹配的括号

set matchtime=1							" 匹配括号高亮的时间（单位是十分之一秒）

set scrolloff=3							" 光标移动到buffer的顶部和底部时保持3行距离

set autoindent							" 自动缩进
set cindent

set tabstop=4							" Tab键的宽度

set softtabstop=4						" 统一缩进为4
set shiftwidth=4

set expandtab							" 不要用空格代替制表符

set smarttab							" 在行和段开始处使用制表符

set incsearch

set langmenu=zh_CN.UTF-8					"语言设置

set linespace=0							" 调整文本行距

set ai 								"Auto indent

set si 								"Smart indet

set wrap 							"Wrap lines

" ******************************************************************************************** "
" ===> Keyborad
" ******************************************************************************************** "

nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>    	" 为方便复制，用<F2>开启/关闭行号显示


" ******************************************************************************************** "
" ===> new file tittle
" ******************************************************************************************** "

"New .c,.h,.sh,.java File，自动插入文件头 
autocmd BufNewFile *.cpp,*.c,*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
" 定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"\#!/bin/bash") 
		call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
	    call append(line(".")+1, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
	    call append(line(".")+1, "")

"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: ") 
		call append(line(".")+2, "	> Mail: ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%:r"))
		call append(line(".")+7,"")
	endif
	"新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G

" ******************************************************************************************** "
" ===> plugins configure
" ******************************************************************************************** "

" ******************************************************************************************** "
" ===> nerdtree plugin
" ******************************************************************************************** "

let g:nerdtree_tabs_open_on_console_startup=1       	"设置打开vim的时候默认打开目录树
map <F3> :NERDTreeTabsToggle <CR>         		"设置打开目录树的快捷键
imap <F3> :NERDTreeTabsToggle <CR>         		"设置关闭目录树的快捷键
map <C-F3> \be  
:autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && exec "redr!"	"打开树状文件目录  

map <C-l> :tabn<cr>             			" 下一个tab
map <C-h> :tabp<cr>             			" 上一个tab
map <C-n> :tabnew<cr>           			" 新tab
map <C-k> :bn<cr>               			" 下一个文件
map <C-j> :bp<cr>               			" 上一个文件

" ******************************************************************************************** "
" ===> vimcdoc plugin
" ******************************************************************************************** "

" 显示中文帮助
if version >= 603
	set helplang=cn			" setting zh_cn
	" set helplang=en		" setting en_us
	set encoding=utf-8
endif

" ******************************************************************************************** "
" ===> ctags plugin
" ******************************************************************************************** "

"set tags=tags  			" 设置tags  
"set autochdir 

" ******************************************************************************************** "
" ===> taglist plugin
" ******************************************************************************************** "

nnoremap <silent> <F8> :TlistToggle<CR>		" 按F8按钮，在窗口的左侧出现taglist的窗口, 像vc的左侧的workpace
" :Tlist              				" 调用TagList
let Tlist_Auto_Open=0 				" 默认打开Taglist 
let Tlist_Ctags_Cmd = '/usr/bin/ctags'  
let Tlist_Show_One_File=0                    	" 只显示当前文件的tags
let Tlist_Exit_OnlyWindow=1                  	" 如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_Use_Right_Window=1                 	" 在右侧窗口中显示taglist窗口
let Tlist_File_Fold_Auto_Close=1             	" 自动折叠

" ******************************************************************************************** "
" ===> bufexplorer plugin
" ******************************************************************************************** "

map <F6> :BufExplorer<CR>

" ******************************************************************************************** "
" ===> Minibuffer plugin
" ******************************************************************************************** "

let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 2
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 25
let g:miniBufExplSplitBelow=1

let g:bufExplorerSortBy = "name"

let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

autocmd BufRead,BufNew :call UMiniBufExplorer

map <leader>u :TMiniBufExplorer<cr>

hi MBEChanged guibg=darkblue ctermbg=darkblue 
"" termbg=darkblue

" ******************************************************************************************** "
" ===> Spell checking
" ******************************************************************************************** "

"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" ******************************************************************************************** "
" ===> Python section
" ******************************************************************************************** "




