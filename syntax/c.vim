" **************************************************************
"                *   Highlight All Function   *
" **************************************************************
syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
" hi cFunctions term=bold cterm=bold ctermfg=lightyellow
" bold、underline、reverse、italic或standout lightyellow
hi cFunctions ctermfg=lightyellow

" **************************************************************
"                *   Highlight All Class   *
" **************************************************************
syn match cClass "\<[a-zA-Z_][a-zA-Z_0-9]*\>::"me=e-2
hi cClass guifg=#1875CD ctermfg=lightyellow

" **************************************************************
"                *   Highlight All Variable   *
"**************************************************************
" hi String            term=bold cterm=bold ctermfg=8
" hi Character         term=bold cterm=bold ctermfg=8
" hi Number            term=bold cterm=bold ctermfg=8
" hi Boolean           term=bold cterm=bold ctermfg=8
" hi Float             term=bold cterm=bold ctermfg=8

"=====================================================================
"      =  如果你自己增加了一个类型或者结构之类的怎么让它也  =
"      =  象"int""void"这样高亮起来呢? 再在上面的文件添加   =
"      =  如下的设置：                                      =
"
" *********************************************************************
"                      *   My Own DataType   *
"
" *********************************************************************
syn keyword cType  uint_t link linkp link_t stu_t stack_t word_t

