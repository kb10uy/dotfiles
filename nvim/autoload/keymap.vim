function! keymap#remap() abort
  call keymap#remap_vim()
  call keymap#remap_shortcut()
  call keymap#remap_surround()
  call keymap#remap_completion()
  call keymap#remap_fzf()
endfunction

" Remap abount standard operations
function! keymap#remap_vim() abort
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
  cnoremap <C-w> <Up>
  cnoremap <C-s> <Down>
  cnoremap <C-a> <Left>
  cnoremap <C-d> <Right>
  tnoremap <C-w> <Up>
  tnoremap <C-s> <Down>
  tnoremap <C-a> <Left>
  tnoremap <C-d> <Right>
endfunction

function! keymap#remap_shortcut() abort
  nnoremap <C-t> :tabe<Space>
  nnoremap <C-d> gt
  nnoremap <C-a> gT
endfunction

" Remap about plugins for surround
function! keymap#remap_surround() abort
  nmap <silent>R <Plug>(operator-surround-append)
  nmap <silent>E <Plug>(operator-surround-replace)
  nmap <silent>Q <Plug>(operator-surround-delete)
endfunction

function! keymap#remap_completion() abort
  nnoremap <F2> :call LanguageClient#textDocument_rename()<CR>
  nnoremap <C-I> :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <F5> :call LanguageClient_contextMenu()<CR>
  inoremap <C-w> <C-p>
  inoremap <C-s> <C-n>
endfunction

function! keymap#remap_fzf() abort
  nnoremap <C-f> :Files<CR>
  nnoremap <C-g> :GFiles<CR>
endfunction
