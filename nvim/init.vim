" dein セットアップ -----------------------------------------------------
let s:localpath = $HOME . '/.local/share/nvim/'
let s:deinpath = s:localpath . 'repos/github.com/Shougo/dein.vim'
let s:initpath = fnamemodify(expand('<sfile>'), ':h')
let &runtimepath = &runtimepath . ',' . s:deinpath
if dein#load_state(s:localpath)
  call dein#begin(s:localpath)
  " for remote plugins
  call dein#load_toml(s:initpath . '/dein.toml')
  " for local plugins
  call dein#local(s:localpath . 'plugins/', {}, ['*'])
  call dein#end()
  call dein#save_state()
endif

" 各種設定 ----------------------------------------------------------------
filetype plugin indent on
syntax enable
language ja_JP.UTF-8

set helplang=ja,en
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set wildmenu
set cmdheight=2
set laststatus=2
set inccommand=split
set encoding=utf8
set fileencodings=utf8
set mouse=a
set notitle
set nofoldenable
set ruler
set number

if v:vim_did_enter
  call initfunc#set_colorscheme()
  call initfunc#remap_keys()
else
  autocmd VimEnter * call initfunc#set_colorscheme()
  autocmd VimEnter * call initfunc#remap_keys()
endif

