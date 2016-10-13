let s:dein_dir = expand('~/.vim')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim' 
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if &compatible
  set nocompatible
endif

call dein#begin('~/.vim')

call dein#add('Shougo/neocomplete.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('jistr/vim-nerdtree-tabs')

call dein#end()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

" NeoComplete
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" NERDTree
let NERDTreeShowHidden = 1

" NERDTree tabs
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_focus_on_files = 1

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

" linenumber
set number

" linebreak
set list

" indent
set autoindent
set smartindent

" tab
set expandtab
set tabstop=2
set softtabstop=2

set ruler
set title
set wildmenu
set wrapscan
