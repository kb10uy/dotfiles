" colorschemeを設定する
function initfunc#set_colorscheme()
  set background=dark
  " VSCodeのターミナルなどは対応してなさげなので
  if $COLORTERM !=# 'truecolor' && $COLORTERM !=# '24bit'
    let g:solarized_termcolors=256
  endif

  colorscheme solarized

  " 背景透過できるターミナル用
  if !empty($TRANSPARENTTERM) || !empty($GNOME_TERMINAL_SCREEN)
    " 背景色を無しにする
    highlight Normal ctermbg=NONE
    highlight clear CursorLine
  endif
endfunction

" キーマップを魔改造する
function initfunc#remap_keys()
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

