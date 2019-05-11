function! keymap#remap()
  call keymap#remap_vim()
  call keymap#remap_surround()
endfunction

" Remap abount standard operations
function! keymap#remap_vim()
  " Movement
  noremap <nowait>a h
  noremap <nowait>s j
  noremap <nowait>w k
  noremap <nowait>d l
  noremap <nowait>, b
  noremap <nowait>. w
  noremap <nowait><lt> <Home>
  noremap <nowait>> <End>
  noremap ?? <lt><lt>

  " Delete, Cut, Yank, Paste
  noremap x "_x
  noremap e c
  noremap q "_d
  noremap r y
  nnoremap ee cc<Esc>
  nnoremap qq "_dd
  nnoremap rr yy
  noremap f p

  " Undo, Redo
  noremap z u
  noremap Z <C-r>

  " Disable false Vim keys
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
endfunction

" Remap about plugins for surround
function! keymap#remap_surround()
  nmap <silent>R <Plug>(operator-surround-append)
  nmap <silent>E <Plug>(operator-surround-replace)
  nmap <silent>Q <Plug>(operator-surround-delete)
endfunction
