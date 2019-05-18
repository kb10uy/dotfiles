function! colorscheme#set_colorscheme() abort
  " TrueColor && Transparented
  " e.g. gnome-terminal
  " $COLORTERM (自動申告) と $TRANSPARENTTERM (手動申告) が
  " 利用される
  "
  " TrueColor && Opaque
  " e.g. iTerm2, PuTTY, NyaoVim (SSH変数透過で自己申告)
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
  "
  set background=dark
  if colorscheme#has_truecolor()
    if $TERM ==# 'screen-256colors'
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    set termguicolors
    colorscheme solarized8
  else
    if !colorscheme#has_solarized_palette()
      let g:solarized_termcolors=256
    endif
    colorscheme solarized
  endif
  call colorscheme#override_colorscheme()
endfunction

function! colorscheme#override_colorscheme() abort
  if colorscheme#has_transparent_bg()
    highlight Normal ctermbg=NONE
    highlight Normal guibg=NONE
    highlight! link SignColumn LineNr
    highlight ALEErrorSign ctermfg=red guifg=#ff0000 guibg=#073642
    highlight ALEWarningSign ctermfg=red guifg=#bf8521 guibg=#073642
    highlight ALEInfoSign ctermfg=red guifg=#223388 guibg=#073642
    highlight clear CursorLine
  endif
  highlight Pmenu ctermbg=12 guibg=#2a4f54
  highlight PmenuSel ctermbg=13 gui=reverse,bold guibg=#2a4f54
endfunction

function! colorscheme#has_truecolor() abort
  return $COLORTERM ==# 'truecolor' || $COLORTERM ==# '24bit'
endfunction

function! colorscheme#has_solarized_palette() abort
  return !empty($SOLARIZEDTERM)
endfunction

function! colorscheme#has_transparent_bg() abort
  return !empty($TRANSPARENTTERM) || exists('g:nyaovim_version')
endfunction
