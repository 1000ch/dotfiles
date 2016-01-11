"skip initialization for vim-tiny or vim-small
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

"NeoBundle
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neocomplcache.vim'
call neobundle#end()

filetype plugin indent on

NeoBundleCheck

syntax enable

set autoread
set encoding=utf-8
set ignorecase
set mouse=a
set nobackup
set nocompatible
set backspace=indent,eol,start
set noswapfile
set showmatch
set showmode
set termencoding=utf-8

"linenumber
set number

"linebreak
set list

"indent
set autoindent
set smartindent

"tab
set expandtab
set tabstop=2
set softtabstop=2

set ruler
set title
set wildmenu
set wrapscan
