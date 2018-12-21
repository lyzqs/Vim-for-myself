source $VIMRUNTIME/vimrc_example.vim

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
set tabstop=4
set shiftwidth=4
set softtabstop=4
" set expandtab
set smartindent
let g:delimitMate_expand_cr = 1
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" vim 自身命令行模式智能补全
set wildmenu
source $VIMRUNTIME/vimrc_example.vim 
source $VIMRUNTIME/mswin.vim
func! RunResult()
        exec "w"
        exec "! %<"
endfunc

map <F9> :call CR()<CR>
imap <F9> <ESC>:call CR()<CR>

func! CompileGcc()
    exec "w"
	exec "!g++ % -o -Wall %<"
	exec "! %<"
endfunc

func! CompileGpp()
    exec "w"
	exec "!g++ % -o -Wall %<"
	exec "! %<"
endfunc

func! CR()
exec "w"
exec "!g++ % -Wall -o %<"
exec "! %<"
endfunc

map <F10> :call RunResult()<CR>
imap <F10> <ESC>:call RunResult()<CR>

syntax enable
colorscheme solarized
set background=dark
let g:solarized_termcolors=256
let g:solarized_underline=0

compiler gcc
set guifont=Consolas:h14

winpos 100 100 " 设置初始界面位置
set lines=60 columns=150 "设置初始界面大小

set mouse=a

map! ` <esc>

vmap <C-c> "+y
map! <C-v> <esc>"+pli
map! <C-r> <esc><C-R>li
map! <C-z> <esc>uli
map! <C-s> <esc>:update<CR>i
map! <C-w> <esc>:exit<CR>i

vmap <backspace> <delete>
set wildmenu
set ai
cd E:\Documents\luogu
set number
set ruler
set showcmd
let g:Powerline_symbols = 'fancy'
set laststatus=2
set noshowmode
set t_Co=256
set nocompatible
let Powerline_symbols='compatible'

set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1

"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8