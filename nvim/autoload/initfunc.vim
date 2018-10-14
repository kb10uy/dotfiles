" colorschemeを設定する
function initfunc#set_colorscheme()
  " TrueColor && Transparented
  " e.g. gnome-terminal
  " $COLORTERM (自動申告) と $TRANSPARENTTERM (手動申告) が
  " 利用される
  "
  " TrueColor && Opaque
  " e.g. iTerm2, PuTTY (SSH変数透過で自己申告)
  " $COLORTERM が利用される
  "
  " 256 Color && Transparented
  " $TRANSPARENTTERMが利用される
  "
  " 256 Color && Opaque
  " e.g. VSCode Integrated Terminal
  " 何も起きない
  "
  " Solarized && Transparent
  " $SOLARIZEDTERM (手動申告) と $TRANSPARENTTERM が利用される
  "
  " Solarized && Opaque
  " e.g. JuiceSSH
  " $SOLARIZEDTERM が利用される

  set background=dark

  if $COLORTERM ==# 'truecolor' || $COLORTERM ==# '24bit'
    set termguicolors
    colorscheme solarized8
  else
    if empty($SOLARIZEDTERM)
      let g:solarized_termcolors=256
    endif
    colorscheme solarized
  endif

  if !empty($TRANSPARENTTERM)
    highlight Normal ctermbg=NONE
    highlight Normal guibg=NONE
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

