" ******************************************************************************************** "
" VIM personal configure
" ******************************************************************************************** "

" ******************************************************************************************** "
" => VIM Determine the operating system
" ******************************************************************************************** "

let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif
 
" ******************************************************************************************** "
" => VIM Determine the is terminal or gui
" ******************************************************************************************** "

if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

" ******************************************************************************************** "
" => VIM Base Configure
" ******************************************************************************************** "



" ******************************************************************************************** "
" ===> VIM General Configure
" ******************************************************************************************** "

syntax on							                " 语法高亮

set showcmd							                " 在状态栏显示正在输入的命令

set number							                " 显示行号

set cul 							                " 高亮光标所在行
set cuc

filetype on							                " 侦测文件类型
filetype plugin on						            " 载入文件类型插件
filetype indent on
 
" NoMatchParen							            " 关闭/打开配对括号高亮
" DoMatchParen

set history=1000						            " 历史记录数

set nocompatible						            " 不要使用vi的键盘模式，而是vim自己的

set noeb							                " 去掉输入错误的提示声音

autocmd! bufwritepost vimrc source ~/.vimrc			" When vimrc is edited, reload it

" ******************************************************************************************** "
" ===> VIM user interface
" ******************************************************************************************** "

set shortmess=atI						            " 启动的时候不显示那个援助乌干达儿童的提示  

set go=      							            " 不要图形按钮  

"set whichwrap+=<,>,h,l     					    " 允许backspace和光标键跨越行边界(不建议)   

set scrolloff=3  						            " 光标移动到buffer的顶部和底部时保持3行距离 

" set foldenable  						            " 允许折叠 

" set foldmethod=manual   					        " 手动折叠 

" set foldmethod=syntax						        " 代码较长时可启用代码折叠功能，如按语法高亮元素折叠   

" set foldlevel=5  						            " 默认情况下不折叠

set nocompatible  						            " 去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限    

set viminfo+=!							            " 保存全局变量

set iskeyword+=_,$,@,%,#,-					        " 带有如下符号的单词不要被换行分割

"set cursorline							            " 突出显示当前行

set magic                   					    " 设置魔术

set guioptions-=T           					    " 隐藏工具栏

set guioptions-=m           					    " 隐藏菜单栏
" set foldcolumn=0
" set foldmethod=indent 

set ignorecase							            " 搜索忽略大小写

set wildmenu							            " 增强模式中的命令行自动完成操作

set report=0							            " 通过使用: commands命令，告诉我们文件的哪一行被改变过

set fillchars=vert:\ ,stl:\ ,stlnc:\				" 在被分割的窗口间显示空白，便于阅读

set cmdheight=2							            " 总是显示状态行

set hlsearch							            " 搜索逐字符高亮

set clipboard+=unnamed						        " 共享剪贴板


" ******************************************************************************************** "
" ===> Colors and Fonts
" ******************************************************************************************** "

color ron							                " 设置背景主题 
" colorscheme desert      					        " gvim

"set guifont=Courier_New:h10:cANSI    				" 设置字体

"autocmd InsertLeave * se nocul    				    " 用浅色高亮当前行 

autocmd InsertEnter * se cul    				    " 用浅色高亮当前行

set ruler       						            " 显示标尺

" ******************************************************************************************** "
" ===> Files, backups and undo
" ******************************************************************************************** "

set confirm							                " 在处理未保存或只读文件的时候，弹出确认

set nobackup							            " 禁止生成临时文件
set noswapfile
set nowb

set autowrite							            " 自动保存

" ******************************************************************************************** "
" ===> Statusline configure
" ******************************************************************************************** "

" ************************************************************************* "
" ======> Statusline format configure
" ************************************************************************* "
" Always hide the statusline
set laststatus=2

" Format the statusline
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
" 
" function! CurDir()
"    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
"     return curdir
" endfunction
" 
" function! HasPaste()
"     if &paste
"         return 'PASTE MODE  '
"     else
"         return ''
"     endif
" endfunction

" ************************************************************************* "
" ======> Neatstatusline plugin configure
" ************************************************************************* "



" ************************************************************************* "
" ======> Mouse configure
" ************************************************************************* "

set mouse=a							                " 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set selection=exclusive
set selectmode=mouse,key

" ******************************************************************************************** "
" ===> Text, tab and indent related
" ******************************************************************************************** "

set backspace=2							            " 使回格键（backspace）正常处理indent, eol, start等

nmap tt :%s/\t/    /g<CR>					        " 将tab替换为空格

set showmatch							            " 高亮显示匹配的括号

set matchtime=1							            " 匹配括号高亮的时间（单位是十分之一秒）

set autoindent							            " 自动缩进
set cindent

set tabstop=4							            " Tab键的宽度

set softtabstop=4						            " 统一缩进为4
set shiftwidth=4

set expandtab							            " 不要用空格代替制表符

set smarttab							            " 在行和段开始处使用制表符

set incsearch

set langmenu=zh_CN.UTF-8					        " 语言设置

set linespace=0							            " 调整文本行距

set ai 								                " Auto indent

set si 								                " Smart indet

set wrap 							                " Wrap lines

" ******************************************************************************************** "
" ===> Keyborad
" ******************************************************************************************** "

nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>    	" 为方便复制，用<F2>开启/关闭行号显示

" ******************************************************************************************** "
" ===> Vim Omni Complete (智能补全)
" ******************************************************************************************** "

"" 智能补全帮助
" :help compl-omni-filetypes
"" cmd
" 整行补全                        	CTRL-X CTRL-L
" 根据当前文件里关键字补全        	CTRL-X CTRL-N
" 根据字典补全                    	CTRL-X CTRL-K
" 根据同义词字典补全              	CTRL-X CTRL-T
" 根据头文件内关键字补全          	CTRL-X CTRL-I
" 根据标签补全                    	CTRL-X CTRL-]
" 补全文件名                      	CTRL-X CTRL-F
" 补全宏定义                      	CTRL-X CTRL-D
" 补全vim命令                     	CTRL-X CTRL-V
" 用户自定义补全方式              	CTRL-X CTRL-U
" 拼写建议                        	CTRL-X CTRL-S 
" ******************************************************************************************** "

set completeopt=preview,menu 					                                            " 代码补全 
" set completeopt+=longest									                                " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)

" autocmd InsertLeave * if pumvisible() == 0|pclose|endif					                " 离开插入模式后自动关闭预览窗口

" inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"					            " 回车即选中当前项

" inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"				            " 上下左右键的行为
" inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
" inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
" inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" 设置补全的字典文件
" au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
" au FileType css setlocal dict+=~/.vim/dict/css.dict
" au FileType c setlocal dict+=~/.vim/dict/c.dict
" au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
" au FileType scale setlocal dict+=~/.vim/dict/scale.dict
" au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
" au FileType html setlocal dict+=~/.vim/dict/javascript.dict
" au FileType html setlocal dict+=~/.vim/dict/css.dict

" ******************************************************************************************** "
" ===> Encodings
" ******************************************************************************************** "

set encoding=utf-8
set fileencoding=utf-8
if (g:iswindows)
    set termencoding=chinese
    language message zh_CN.UTF-8
else
    set fileencodings=ucs-bom,gb18030,gbk,gb2312,cp936
    set termencoding=utf-8
    set langmenu=zh_CN.UTF-8
    language messages zh_CN.UTF-8
    set guifontset=wenquanyi,-*-16-*-*-*
endif

" ******************************************************************************************** "
" ===> new file tittle
" ******************************************************************************************** "

"New .c,.h,.sh,.java File，自动插入文件头 
autocmd BufNewFile *.cpp,*.c,*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
" 定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh'
		call setline(1, "\#! /bin/bash")
		call append(line("."), "")
		call append(line(".") + 1, "")
"		 call ScriptTypeTittle()

    elseif &filetype == 'python'
        call setline(1,"#! /usr/bin/env python")
        call append(line("."), "# -*- coding: utf-8 -*-")
	    call append(line(".") + 1, "")
	    call ScriptTypeTittle()

    elseif &filetype == 'ruby'
        call setline(1,"#! /usr/bin/env ruby")
        call append(line("."), "# encoding: utf-8")
	    call append(line(".") + 1, "")
" 	     call ScriptTypeTittle()

"    elseif &filetype == 'mkd'
"        call setline(1, "<head><meta charset=\"UTF-8\"></head>")
"        call append(line("."), "")
"        call append(line(".") + 1, "")
"		 call ScriptTypeTittle()
    endif

    if &filetype == 'cpp'
		call CompileTypeTittle()
		call append(line(".") + 7, "#include <iostream>")
		call append(line(".") + 8, "")
	endif

	if &filetype == 'c'
		call CompileTypeTittle()
		call append(line(".") + 7, "#include <stdio.h>")
		call append(line(".") + 8, "")
	endif

	if &filetype == 'java'
		call CompileTypeTittle()
		call append(line(".") + 7,"public class ".expand("%:r"))
		call append(line(".") + 8,"")
	endif

	"新建文件后，自动定位到文件末尾
endfunc 

func ScriptTypeTittle()							" script file head, example: python, ruby ...
	call append(line(".") + 2, '" *************************************************************************')
	call append(line(".") + 3, '"   > File Name : '.expand("%"))
	call append(line(".") + 4, '"   > Author : Ray')
	call append(line(".") + 5, '"   > Mail : ray.kk.na@gmail.com')
	call append(line(".") + 6, '"   > Created Time : '.strftime("%c"))
	call append(line(".") + 7, '"   > Comment : ')
	call append(line(".") + 8, '" *************************************************************************')
	call append(line(".") + 9, "")

endfunc

func CompileTypeTittle()							" script file head, example: python, ruby ...
	call setline(1, "/ *************************************************************************")
	call append(line("."), "    > File Name : ".expand("%"))
	call append(line(".") + 1, "    > Author : Ray")
	call append(line(".") + 2, "    > Mail : ray.kk.na@gmail.com")
	call append(line(".") + 3, "    > Created Time : ".strftime("%c"))
	call append(line(".") + 4, "    > Comment : ")
	call append(line(".") + 5, "  ************************************************************************* /")
	call append(line(".") + 6, "")

endfunc

autocmd BufNewFile * normal G

" ******************************************************************************************** "
" ===> Open/close file operators
" ******************************************************************************************** "

if has("autocmd")                                           " 恢复文件关闭时光标位置
      autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
endif

" ******************************************************************************************** "
" ===> plugins configure
" ******************************************************************************************** "

" ******************************************************************************************** "
" ===> nerdtree plugin
" ******************************************************************************************** "

let g:nerdtree_tabs_open_on_console_startup=1       	    "设置打开vim的时候默认打开目录树
map <F3> :NERDTreeTabsToggle <CR>         		            "设置打开目录树的快捷键
imap <F3> :NERDTreeTabsToggle <CR>         		            "设置关闭目录树的快捷键
map <C-F3> \be  

autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && exec "redr!"	" 打开树状文件目录  
autocmd vimenter * if !argc() | NERDTree | endif	        "当打开vim且没有文件时自动打开NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif		" 只剩 NERDTree时自动关闭

map <C-l> :tabn<cr>             			                " 下一个tab
map <C-h> :tabp<cr>             			                " 上一个tab
map <C-n> :tabnew<cr>       			                    " 新tab
map <C-k> :bn<cr>               			                " 下一个文件
map <C-j> :bp<cr>               			                " 上一个文件

" ******************************************************************************************** "
" ===> vimcdoc plugin
" ******************************************************************************************** "

" 显示中文帮助
if version >= 603
	set helplang=cn			                                " setting zh_cn
	" set helplang=en		                                " setting en_us
	set encoding=utf-8
endif

" ******************************************************************************************** "
" ===> ctags plugin
" ******************************************************************************************** "

if has("ctags")
    "set tags=tags  			                                " 设置tags  
    "set autochdir 

endif

" ******************************************************************************************** "
" ===> taglist plugin
" ******************************************************************************************** "

if has("TagList")
    nnoremap <silent> <F8> :TlistToggle<CR>		                " 按F8按钮，在窗口的左侧出现taglist的窗口, 像vc的左侧的workpace
    " :Tlist              				                        " 调用TagList
    let Tlist_Auto_Open=0 				                        " 默认打开Taglist 
    let Tlist_Ctags_Cmd = '/usr/bin/ctags'  
    let Tlist_Show_One_File=0                    	            " 只显示当前文件的tags
    let Tlist_Exit_OnlyWindow=1                  	            " 如果Taglist窗口是最后一个窗口则退出Vim
    let Tlist_Use_Right_Window=1                 	            " 在右侧窗口中显示taglist窗口
    let Tlist_File_Fold_Auto_Close=1             	            " 自动折叠

endif

" ******************************************************************************************** "
" ===> tabpage plugin
" ******************************************************************************************** "
set showtabline=2 				                            " tab page height
set guitablabel=%t

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

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" ******************************************************************************************** "
" ===> Python section
" ******************************************************************************************** "



" ******************************************************************************************** "
" ===> Neocomplcache plugin
" ******************************************************************************************** "

" Disable AutoComplPop.

let g:acp_enableAtStartup = 0

" Use neocomplcache.

let g:neocomplcache_enable_at_startup = 1

" Use smartcase.

let g:neocomplcache_enable_smart_case = 1

" Use camel case completion.

let g:neocomplcache_enable_camel_case_completion = 1

" Use underbar completion.

let g:neocomplcache_enable_underbar_completion = 1

" Set minimum syntax keyword length.

let g:neocomplcache_min_syntax_length = 3

let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" AutoComplPop like behavior.

let g:neocomplcache_enable_auto_select = 0

" When you input 'ho-a',neocomplcache will select candidate 'a'.

let g:neocomplcache_enable_quick_match = 1

" * Define dictionary.
if g:islinux
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'php_funclist' : '~/.vim/dict/php_funclist.dict',
        \ 'css' : '~/.vim/dict/css.dict',
        \ 'c' : '~/.vim/dict/c.dict',
        \ 'cpp' : '~/.vim/dict/cpp.dict',
        \ 'scale' : '~/.vim/dict/scale.dict',
        \ 'javascript' : '~/.vim/dict/javascript.dict'
        \ }
endif

" let g:neocomplcache_snippets_dir=$VIMFILES."/snippets"

inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

inoremap <expr><C-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

" Define keyword.

if !exists('g:neocomplcache_keyword_patterns')

  let g:neocomplcache_keyword_patterns = {}

endif

let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.

imap <C-k>     <Plug>(neocomplcache_snippets_expand)

smap <C-k>     <Plug>(neocomplcache_snippets_expand)

inoremap <expr><C-g>     neocomplcache#undo_completion()

inoremap <expr><C-z>     neocomplcache#undo_completion()

inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.

"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.

" <CR>: close popup and save indent.

" inoremap <expr><CR>  neocomplcache#close_popup() . "\<CR>"

inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

" <TAB>: completion. THIS HAS NO USE WHEN WITH SNIPMATE

" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <SPACE>: completion.

inoremap <expr><space>  pumvisible() ? neocomplcache#close_popup() . "\<SPACE>" : "\<SPACE>"

" <C-h>, <BS>: close popup and delete backword char.

inoremap <expr><C-h> neocomplcache#close_popup()."\<C-h>"

inoremap <expr><BS> neocomplcache#close_popup()."\<C-h>" 

inoremap <expr><C-y>  neocomplcache#close_popup()

inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Shell like behavior(not recommended).

"set completeopt+=longest

"let g:neocomplcache_enable_auto_select = 1

"let g:neocomplcache_disable_auto_complete = 1

"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"

"inoremap <expr><CR>  neocomplcache#close_popup() . "\<CR>"

" Enable omni completion.

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags

autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete


" Enable heavy omni completion.

if !exists('g:neocomplcache_omni_patterns')

   let g:neocomplcache_omni_patterns = {}

endif

let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'

let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" ******************************************************************************************** "
" ===> Cscope plugin
" ******************************************************************************************** "

if has("cscope")
    """"""""""""" Standard cscope/vim boilerplate
    " generation cscope.out and ini ... configure files
    " if(has('win32'))
    "     silent! execute "!dir /b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
    " else
    "     silent! execute "!find . -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.m" -o -name "*.mm" -o -name "*.java" -o -name "*.py" > cscope.files"
    " endif
    
    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    "if filereadable("cscope.out")
     "   cs add cscope.out  
    " else add the database pointed to by environment variable 
    "elseif $CSCOPE_DB != ""
     "   cs add $CSCOPE_DB
    "endif

    " show msg when any other cscope db added
    set cscopeverbose  


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100
    
    " cscope.out config file dir added .
    " cs add /home/kylin/cscope.out /home/kylin/

endif

