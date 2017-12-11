
"**************************************************************************************
"	file:	vim配置文件
"	author:	李兴中
"	date:	2017.12.17
"**************************************************************************************

"**************************************************************************************
"	section 1:基本设置
"**************************************************************************************

set nocompatible													"关闭兼容模式

"鼠标设置:
set mouse=a																"启动对鼠标的支持
set selection=exclusive										"允许区域选择
set selectmode=mouse,key									"设置选择模式为mouse和key

"窗口参数设置:
winpos 5 5																"设定窗口位置
set lines=60 columns=200									"设定窗口大小

"光标所在行设置:
set number																"显示行号
set ruler																	"标尺功能，显示光标位置状态行
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "设置状态行显示的内容  
set laststatus=2													"设置总是显示状态行(1:不显示;2:显示)
set cursorline														"高亮显示光标所在行
set nowrap																"设置不自动换行
set novisualbell													"去掉输入错误时光标闪烁 

"命令行模式设置:
set cmdheight=2														"设置命令行的高度为2(默认为1)
set showcmd																"显示输入的命令 

"tab/backspace相关设置:
set noexpandtab														"不将 tab 化为 space 存储
set shiftwidth=2													"设置 tab 宽度为2个 space
set tabstop=2															"将 tab 解释为2个空格
set softtabstop=2													"在编辑动作(backspace)时，对空白的解释(在操作backspace时，2个空白会被当成一个tab删除)
set backspace=indent,eol,start						"使backspace正常处理indent,eol,start 

"自动缩进设置:
set autoindent														"设置自动缩进(即：继承前一行的缩进方式)

"文件相关设置:
set autowrite															"设置自动保存
set autoread															"文件被改动时自动载入
set nobackup															"不备份文件
set noswapfile														"不生成swap文件

"折叠相关设置:
set foldenable														"允许折叠
set foldmethod=syntax											"语法高亮折叠
let fortran_fold=1												"允许fortran代码折叠
noremap <F5> zo														"设置<F5>:打开折叠
noremap <F6> zc														"设置<F6>:关闭折叠

"搜索相关设置:
set incsearch															"增量式搜索(在搜索时，输入的语句逐字符高亮)
set hlsearch															"高亮显示被搜索的内容
set ignorecase														"搜索忽略大小写

"匹配相关设置:
set showmatch															"高亮显示匹配的括号
set matchtime=10													"设置匹配括号高亮的时间为10s

"编码/解码相关设置:
set enc=utf-8															"转化为当前系统编码(utf-8)来显示
set fenc=utf-8														"设置当前文件的编码为utf-8
set fencs=utf-8,gbk,big5,cp936,gb18030,gb2312,utf-16,ucs-bom,shift-jis	"打开文件时进行解码的猜测列表

"显示相关设置:
colorscheme ron														"设置配色方案(不设置即为默认配色方案)
set scrolloff=3														"设置光标移动到Buffer顶部和底部时保持三行的距离

"语法高亮设置:
syntax on																	"打开语法高亮

"文件类型检测设置:
filetype plugin indent on									"文件类型检测

"***********************************************************************************************
"	section 2:自动补全设置
"***********************************************************************************************

"自动补全括号，引号等

:inoremap ( ()<ESC>i

:inoremap { {}<ESC>i

:inoremap [ []<ESC>i

:inoremap " ""<ESC>i

:inoremap ' ''<ESC>i

let g:SuperTabRetainCompletionType=2								"0-不记录上次的补全方式;1-记住上次的补全方式，直到使用其他的补全命令改变它;2-记住上次的补全方式，直到按ESC退出插入模式

let g:SuperTabDefaultCompletionType="<C-N>"					"设置按下tab键后默认的补全方式为<Ctrl+N>,更多补全方式用 :help ins-completion 查看

set completeopt=longest,menu												"只在下拉菜单中显示匹配项目

"***********************************************************************************************
"	section 3:ctags
"***********************************************************************************************

set tags=./tags;																		"指定tags文件为当前路径下的tags文件

set autochdir																				"自动切换当前目录为当前文件所在的目录

noremap <F2> :!ctags -R<CR>													"设置<F2>:递归地为当前目录及子目录下的所有代码文件生成tags文件

noremap <F3> <C-]>																	"设置<F3>:跳到函数，变量等被定义的地方

noremap <F4> <C-T>																	"设置<F4>:跳回到函数，变量等被调用的地方

"**********************************************************************************************
" section 4:taglist
"**********************************************************************************************

let Tlist_Show_One_File=1														"不同时显示多个文件的tag,只显示当前文件的tag

let Tlist_File_Fold_Auto_CLose=1										"当同时显示多个文件中的tag时，使taglist只显示当前文件tag,其他文件的tag都被折叠起来

let Tlist_Enable_Fold_Column=1											"显示折叠树

let Tlist_Exit_OnlyWindow=0													"taglist为最后一个窗口时，退出vim

let Tlist_Sort_Type="name"													"taglist以tag名称进行排序，缺省时按tag在文件中出现的顺序进行排序

let Tlist_WinHeight=50															"设置taglist窗口高度

let Tlist_WinWidth=30																"设置taglist窗口宽度

"************************************************************************************************
" section 5:quickfix
"************************************************************************************************

noremap <F7> :botright copen 10<CR>									"设置<F7>:在屏幕底部打开quickfix窗口(高度为10行)

noremap <F8> :cclose<CR>														"设置<F8>:关闭quickfix窗口的快捷键

"************************************************************************************************
" section 6:cscope
"************************************************************************************************

set cscopequickfix=s-,c-,d-,i-,t-,e-								"使用quickfix窗口来显示cscope的查找结果

"************************************************************************************************
"	section 4:minibufexpl
"************************************************************************************************

let g:miniBufExplMapWindowNavVim = 1								"可以用 <Ctrl> + h,j,k,l 切换到上下左右的不同窗口 

let g:miniBufExplMapWindowNavArrows=1								"可以用 <Ctrl> + 箭头 切换到上下左右的不同窗口

let g:miniBufExplMapCTabswitchBufs=1								"<Ctrl> + <tab> 向前循环切换到每个buffer名上;<Ctrl> + <tab> + <shift> 向后循环切换到每个buffer名上

let g:miniBufExplModSelTarget = 1										"设置只在源码窗口打开选中的buffer(默认是关闭的)

"************************************************************************************************
" section 5:winmanager
"************************************************************************************************

let g:NERDTree_title="[NERDTree]"										"设置界面分割
let g:winManagerWindowLayout="NERDTree|TagList"		

let g:WinManagerWidth=30														"设置winmanager的宽度为30

noremap <F10> :WMToggle<CR>													"设置<F10>:打开/关闭winmanger

function! NERDTree_Start()
	exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
	return 1
endfunction

"***********************************************************************************************
"	section 6: make/quit 快捷键设置
"***********************************************************************************************

noremap <F9> :make<CR>															"设置<F9>:make

noremap <F12> :xa<CR>																"设置<F12>:保存并且退出
