let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
let g:python3_host_prog=expand('~/.pyenv/versions/3.6.4/bin/python3')
let g:python_host_prog=expand('~/.pyenv/versions/2.7.14/bin/python2')
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

filetype plugin indent on
syntax enable

"End dein Scripts-------------------------

language ja_JP.UTF-8
set helplang=ja,en

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set title
set wildmenu
set cmdheight=2
set laststatus=2
set inccommand=split
set encoding=utf8
set fileencodings=utf8
set t_ut=
set mouse=a
set notitle

set ruler 
set number

function! RemapKeys()
  noremap <nowait>a h
  noremap <nowait>s j
  noremap <nowait>w k
  noremap <nowait>d l
  noremap <nowait>, b
  noremap <nowait>. w
  noremap <nowait><lt> <Home>
  noremap <nowait>> <End>
  noremap e c
  noremap q d
  noremap r y
  noremap ee cc
  noremap qq dd
  noremap rr yy
  noremap f p
  noremap z u
  noremap Z <C-r>
  noremap x x
  noremap ?? <lt><lt>
  noremap <nowait>c i
  noremap <nowait>C I
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
  set backspace=
endfunction

function! Solarize()
" let g:solarized_termcolors=256
  colorscheme solarized
  set background=dark
endfunction

function! Molokaize()
  colorscheme molokai
endfunction

function! Hybridize()
  colorscheme hybrid
  set background=dark
endfunction

autocmd VimEnter * call Hybridize()
autocmd VimEnter * call RemapKeys()
