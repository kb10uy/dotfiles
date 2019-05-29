let s:initpath = fnamemodify(expand('<sfile>'), ':p:h:h')

function! variables#load_plugins() abort
  let s:localpath = $HOME . '/.local/share/nvim/'
  let s:deinpath = s:localpath . 'repos/github.com/Shougo/dein.vim'
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
endfunction

function! variables#set_flags() abort
  " 日本語・エンコーディング
  language ja_JP.UTF-8
  set helplang=ja,en
  set encoding=utf8
  set fileencodings=utf8

  " 表示
  set notitle
  set nofoldenable
  set ruler
  set number
  set completeopt=menu
  set cmdheight=2
  set laststatus=2

  " 挙動
  set backspace=
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
  set expandtab
  set wildmenu
  set inccommand=split
  set mouse=a
  set hidden
endfunction

function! variables#set_variables()
  call variables#set_vimtex()
  call variables#set_python()
endfunction

function! variables#set_vimtex() abort
  let g:vimtex_compiler_progname = 'nvr'
  let g:tex_flavor = 'latex'
endfunction

function! variables#set_python() abort
  let g:python_host_prog = ''
  if hostname() =~ '^tus'
    let g:python3_host_prog = '/usr/bin/python3.6'
  else
    let g:python3_host_prog = trim(system('which python3'))
  endif
endfunction
