set encoding=utf-8
set ffs=unix,dos,mac
set title
set mouse=a
set whichwrap=b,s,h,l,<,>,[,]
set autoread
set showcmd
set noswapfile
set nobackup
set showmode
set ruler
set number
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=2
syntax on
set wildmenu
set cursorline
set hlsearch
set ignorecase
set smartcase
set incsearch
set backspace=indent,eol,start
set showmatch

autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yml  setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml  setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType sh   setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType zsh  setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css  setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType js   setlocal shiftwidth=2 tabstop=2 softtabstop=2


" dein
let s:dein_dir = expand('~/.vim')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

call dein#begin('~/.vim')

call dein#add('Shougo/neocomplete.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('jistr/vim-nerdtree-tabs')
call dein#add('vim-syntastic/syntastic')
call dein#add('mtscout6/syntastic-local-eslint.vim')
call dein#add('1000ch/syntastic-local-stylelint.vim')

call dein#end()

if dein#check_install()
  call dein#install()
endif

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" NeoComplete
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" NERDTree
let NERDTreeShowHidden = 1

" NERDTree tabs
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_focus_on_files = 1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_css_checkers = ['stylelint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" powerline
set rtp+=~/.vim/repos/github.com/powerline/powerline/powerline/bindings/vim
