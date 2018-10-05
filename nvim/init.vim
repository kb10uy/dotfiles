" dein セットアップ -----------------------------------------------------
let s:localpath = '/home/kb10uy/.local/share/nvim/'
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
let g:python3_host_prog=expand('~/.pyenv/versions/3.6.4/bin/python3')
let g:python_host_prog=expand('~/.pyenv/versions/2.7.14/bin/python2')

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
set ruler
set number

autocmd VimEnter * call RemapKeys()
autocmd VimEnter * call SetColorScheme()

" 起動時にやるやつ ----------------------------------------------------

" キーマップを魔改造する
function! RemapKeys()
  " FPS仕様
  noremap <nowait>a h
  noremap <nowait>s j
  noremap <nowait>w k
  noremap <nowait>d l
  noremap <nowait>, b
  noremap <nowait>. w
  noremap <nowait><lt> <Home>
  noremap <nowait>> <End>
  noremap e c
  noremap q "_d
  noremap r y
  noremap ee cc<Esc>
  noremap qq "_dd
  noremap rr yy
  noremap f p
  noremap z u
  noremap Z <C-r>
  noremap x "_x
  noremap ?? <lt><lt>
  noremap <Home> <Nop>
  noremap <End> <Nop>
  noremap <Up> <Nop>
  noremap <Down> <Nop>
  noremap <Left> <Nop>
  noremap <Right> <Nop>
  inoremap <Up> <Nop>
  inoremap <Down> <Nop>
  inoremap <Left> <Nop>
  inoremap <Right> <Nop>

  " vim-surround
  nmap E cs
  nmap Q ds
  nmap R ys

  " 打ちやすさ重視
  nmap RIW ysiw
  set backspace=
endfunction

" colorschemeを設定する
function! SetColorScheme()
  " let g:solarized_termcolors=256
  set background=dark
  colorscheme solarized

  " VSCodeのターミナルなどは対応してなさげなので
  if $COLORTERM !=# 'truecolor' && $COLORTERM !=# '24bit'
    let g:solarized_termcolors=256
  endif

  " 背景透過できるターミナル用
  if !empty($TRANSPARENTTERM) || !empty($GNOME_TERMINAL_SCREEN)
    " 背景色を無しにする
    highlight Normal ctermbg=NONE
    highlight clear CursorLine
  endif
endfunction

