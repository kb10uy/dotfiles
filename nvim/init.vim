" dein セットアップ -----------------------------------------------------
let s:localpath = $HOME . '/.local/share/nvim/'
let s:deinpath = s:localpath . 'repos/github.com/Shougo/dein.vim'
let s:initpath = fnamemodify(expand('<sfile>'), ':h')
let &runtimepath = &runtimepath . ',' . s:deinpath
if dein#load_state(s:localpath)
  call dein#begin(s:localpath)
  " for remote plugins
  call dein#load_toml(s:initpath . '/dein.toml')
  call dein#load_toml(s:initpath . '/dein-lazy.toml', {'lazy': 1})
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
set backspace=
set expandtab
set wildmenu
set cmdheight=2
set laststatus=2
set inccommand=split
set encoding=utf8
set fileencodings=utf8
set mouse=a
set completeopt=menu
set notitle
set nofoldenable
set ruler
set number

if hostname() =~ '^tus'
  let g:python3_host_prog = '/usr/bin/python3.6'
endif

call keymap#remap()
call colorscheme#set_colorscheme()
call variables#set_variables()

