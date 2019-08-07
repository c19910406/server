"设置代码行数
set number
"始终保持5行
set scrolloff=5
"下划线
set cursorline
"命令联想
set wildmenu
"搜索忽略大小写
set ignorecase
"开始插件头
call plug#begin()
"nerdtree 
Plug 'scrooloose/nerdtree'
"ncm2自带
Plug 'ncm2/ncm2'
"python 插件
Plug 'ncm2/ncm2-jedi'
"ncm2 自带
Plug 'roxma/nvim-yarp'
"ncm2 自带
Plug 'ncm2/ncm2-bufword'
"ncm2 路径
Plug 'ncm2/ncm2-path'
"ncm2 高亮
Plug 'ncm2/ncm2-match-highlight'
"semshi同单词高亮
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
"状态栏
Plug 'vim-airline/vim-airline'
"函数跳转
Plug 'ludovicchabant/vim-gutentags'
call plug#end()
"自动运行nerdtree
"autocmd VimEnter * NERDTree
"把nerdtree改成tt快捷键
map tt :NERDTreeToggle<CR>
"nerdtree 显示隐藏文件
let NERDTreeShowHidden=1
"自动运行 ncm2 
autocmd BufEnter * call ncm2#enable_for_buffer()
"ncm2 必装
set completeopt=noinsert,menuone,noselect
"这两个是把c-n换成TAB
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"semshi同单词高亮把错误提示取消
let g:semshi#error_sign = {"v:false"}
"快捷键取消搜索高亮，同时按下空格+回车
let mapleader=" "
"配色
let &t_ut=''
noremap <LEADER><CR> :nohlsearch<CR>
"xxxxxxxxxxxxxxx函数跳转配置，下面都是xxxxxxxxxxxxxxxx
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
   endif
" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
"xxxxxxxxxxxxxxxx函数跳转配置结束！xxxxxxxxxxxxxxxxx

"括号自动配对
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap < <><ESC>i
inoremap > <c-r>=ClosePair('>')<CR>
function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf
"括号自动配对完成
