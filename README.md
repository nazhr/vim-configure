安装 ：
===
1. 在Linux中配置，将vim-configure目录拷贝到~/目录下，并且将文件名修改成.vim 。
2. 将.vimrc文件拷贝到~/目录下。

配置日志：
===
1. NERDTree install
---
####commit : 
	目录树

####url : 
	https://github.com/scrooloose/nerdtree.git

####cmd : 
	mkdir bundle
	cd ~/.vim/bundle
	git clone https://github.com/scrooloose/nerdtree.git

####install : 
	cp * ../../

####config -- .vimrc
```
map <C-l> :tabn<cr>             " 下一个tab
map <C-h> :tabp<cr>             " 上一个tab
map <C-n> :tabnew<cr>           " 新tab
map <C-k> :bn<cr>               " 下一个文件
map <C-j> :bp<cr>               " 上一个文件
```

2. NERDTree-Tabs install
---
####commit : 
	目录树

####url : 
	https://github.com/jistr/vim-nerdtree-tabs.git

####cmd : 
	mkdir bundle
	cd ~/.vim/bundle
	git clone https://github.com/jistr/vim-nerdtree-tabs.git

####install : 
	cp * ../../

####config -- .vimrc
```
let g:nerdtree_tabs_open_on_console_startup=1       	" 设置打开vim的时候默认打开目录树
map <F3> :NERDTreeTabsToggle <CR>         		" 设置打开目录树的快捷键
imap <F3> :NERDTreeTabsToggle <CR>         		" 设置关闭目录树的快捷键
```

3. vimcdoc install
---
####commit : 
	中文帮助文档

####url : 
	http://sourceforge.net/projects/vimcdoc/files/vimcdoc/1.8.0/vimcdoc-1.8.0.tar.gz

####cmd : 
	mkdir bundle
	cd ~/.vim/bundle
	wget http://sourceforge.net/projects/vimcdoc/files/vimcdoc/1.8.0/vimcdoc-1.8.0.tar.gz

####install : 
	./vimcdoc.sh -i

####config -- .vimrc
```
set helplang=cn			" setting zh_cn
set helplang=en			" setting en_us
set encoding=utf-8
```

4. ctags install
---
####commit : 
	方法/函数索引

####url : 
	*

####cmd : 
	ctags -R *

####install : 
	sudo apt-get install ctags

####config -- .vimrc
```
set tags=tags  		" 设置tags  
set autochdir 
```

5. taglist install
---
####commit : 
	方法/函数索引列表	

####url : 
	http://www.vim.org/scripts/script.php?script_id=273

####cmd : 
	*

####install : 
	cp -r * ../../

####config -- .vimrc
```
nnoremap <silent> <F8> :TlistToggle<CR><CR>	" 按F8按钮，在窗口的左侧出现taglist的窗口, 像vc的左侧的workpace
" :Tlist              				" 调用TagList
let Tlist_Auto_Open=0 				" 默认打开Taglist 
let Tlist_Ctags_Cmd = '/usr/bin/ctags'  
let Tlist_Show_One_File=1                    	" 只显示当前文件的tags
let Tlist_Exit_OnlyWindow=1                  	" 如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_Use_Right_Window=1                 	" 在右侧窗口中显示taglist窗口
let Tlist_File_Fold_Auto_Close=1             	" 自动折叠
```

6. bufexplorer install
---
####commit : 
	插件 bufexplorer 是一款可以让你更加轻松的在各个 buffer 之间进行切换。

####url : 
	http://www.vim.org/scripts/script.php?script_id=42

####cmd : 
	*

####install : 
	cp -r * ../../

####config -- .vimrc
```
map <F6> :BufExplorer<CR>
```

7. Minibuffer install
---
####commit : 
	＊
####url : 
	http://www.vim.org/scripts/script.php?script_id=159

####cmd : 
	＊

####install : 
	cp -r * ../../

####config -- .vimrc
```
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
```

8. Spell Check install
---
####commit : 
	Vim 自带的拼写检查(Spell Check)

####url : 
	https://github.com/vim-scripts/SpellCheck

####cmd : 
	*

####install : 
	
####config -- .vimrc
```
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
```

9. Pydiction install
---
####commit : 
	pydiction 用来实现代码补全和语法提示功能

####url : 
	https://github.com/rkulla/pydiction.git 

####cmd : 
	*

####install : 
```
	* Linux/Unix系统：将python_pydiction.vim文件复制到 ~/.vim/after/ftplugin 目录下。如果该目录不存在，则创建它，vim会自动在此目录下搜索。

　　	* Windows系统：将python_pydiction.vim文件复制到 C:\vim\vimfiles\ftplugin 目录下（假设你的Vim安装路径为C:\vim）

　　	* 除此之外的另两个文件complete-dict和pydiction.py可以放置到任何你想放置的位置，但在ftplugin目录下最好只存放python_pydiction.vim而不应该还有其他文件。
	进入解压后的pydiction目录

	$ cp after/ftplugin/python_pydiction.vim ~/.vim/after/ftplugin
	$ cp complete-dict ~/.vim
	$ cp pydiction.py ~/.vim
	
	* 解决tab键冲突问题：
		* Pydiction tab键修改：
		sudo ~/.vim/bundle/Pydiction/after/ftplugin/python_pydiction.vim 找到这行
		inoremap <silent> <buffer> <TAB>
		修改为下面这样，就可以通过Ctrl+p来进行补全了。
		inoremap <silent> <buffer> <C-y>
		inoremap <silent> <buffer> <S-TAB>换成
		inoremap <silent> <buffer> <C-S-y>
```

####config -- .vimrc
```
"pydiction 1.2 python auto complete
filetype plugin on
let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'
"defalut g:pydiction_menu_height == 15
"let g:pydiction_menu_height = 20 
```

10. Neocomplcache install
---
####commit : 
	Neocomplcache 自动补全

####url :   
	http://www.vim.org/scripts/script.php?script_id=2620

####cmd : 
	*
####install : 
	cp -r * ../../

####config -- .vimrc
```
let g:neocomplcache_enable_at_startup = 1
```

11. Tabpage install
---
####commit : 
	一个分页容纳一或多个窗口。分页间很容易切换，这种方式使你可以拥有多个窗口集合，每个集合做不同的工作

####url :   
	http://www.vim.org/scripts/script.php?script_id=3712

####cmd : 
	*
####install : 
	cp -r * ../../

####config -- .vimrc
```
set showtabline=2 	" set tab page height 
set guitablabel=%t
```
12. TaskList install
---
####commit : 
	调用任务列表窗口

####url :   
	http://www.vim.org/scripts/script.php?script_id=2607

####cmd : 
	*
####install : 
	cp -r * ../../

####config -- .vimrc
```
map t :TaskList<CR>
```
13. CSCope install
---
####commit : 
	cscope主要用来协助浏览C/C++语言，他的功能要强大于ctags，不仅支持变量/函数的定义查询，还记录了函数的调用处查询等功能，所以也有说法称cscope的诞生就是为了取代ctags

####url :   
	*

####cmd : 
	cscope -Rdkp // 生成cscope.out cscope.ini ... 配置文件。详细查看帮助
	
####install : 
	linux : apt-get install cscope / windows : exe install

####config -- .vimrc
```
if has("cscope")
    """"""""""""" Standard cscope/vim boilerplate

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
```


* 其它插件(选择安装) 	<br/>
---
1. CSCope
	* cscope主要用来协助浏览C/C++语言，他的功能要强大于ctags，不仅支持变量/函数的定义查询，还记录了函数的调用处查询等功能，所以也有说法称cscope的诞生就是为了取代ctags。
2. Beautify statusline
	* vim 状态行主题插件
3. Fugitive
	* 让 Vim 更好地与 Git 整合
4. Powerline
	* 炫丽实用的状态栏
5. Tagbar
	* 比 taglist 更现代的代码结构浏览工具
6. The NERD tree
	* 以树形结构浏览文件夹中的文件
7. Syntastic
	* 语法检查
8. surround.vim
	* 快速删除/修改光标周围配对的括号
9. Project
	* 方便管理工程中的文件
10. snipmate.vim
	* 在编辑中实现模板展开
11. a.vim
	* 在.cpp/.h等文件对中跳转
12. matchit.zip
	* 增强%的功能
13. winmanager
	* 将文件管理窗口和taglist堆叠起来
14. indentLine
	* 显示对齐线插件
15. ctrlp
	* Full path fuzzy file, buffer, mru, tag, ... finder for Vim
