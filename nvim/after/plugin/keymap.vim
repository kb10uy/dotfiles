" Remap abount standard operations
function! s:remap_vim()
  " Movement
  noremap <nowait>a h
  noremap <nowait>s j
  noremap <nowait>w k
  noremap <nowait>d l
  noremap <nowait>W <C-u>
  noremap <nowait>S <C-d>
  noremap <nowait>D I
  noremap <nowait>, b
  noremap <nowait>. w
  noremap <nowait><lt> <Home>
  noremap <nowait>> <End>
  noremap ?? <lt><lt>
  ounmap a
  ounmap s
  ounmap w
  ounmap d

  " Delete, Cut, Yank, Paste
  noremap x "_x
  noremap e c
  noremap q "_d
  noremap r y
  nnoremap ee cc<Esc>
  nnoremap qq "_dd
  nnoremap rr yy
  vnoremap e d
  noremap f P
  noremap F p
  vnoremap f "_dP
  vnoremap F "_dp
  nnoremap <C-w> <C-a>
  nnoremap <C-s> <C-x>
  command! -complete=command -range Q <line1>,<line2>d
  command! -complete=command -range E <line1>,<line2>c
  command! -complete=command -range R <line1>,<line2>y

  " Whole operation
  noremap <M-I> gg=G2<C-O>
  tnoremap <M-Esc> <C-\><C-n>
  noremap <C-q> <Esc>
  inoremap <C-q> <Esc>
  tnoremap <C-q> <C-\><C-n>
  noremap m q

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

function! s:remap_shortcut()
  nnoremap <C-t> :tabe<Space>
  nnoremap <C-d> gt
  nnoremap <C-a> gT
endfunction

" Remap about plugins for surround
function! s:remap_surround()
  nmap <silent>R <Plug>(operator-surround-append)
  nmap <silent>E <Plug>(operator-surround-replace)
  nmap <silent>Q <Plug>(operator-surround-delete)
endfunction

function! s:remap_completion()
  nnoremap <F2> :call LanguageClient#textDocument_rename()<CR>
  nnoremap <C-I> :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <F5> :call LanguageClient_contextMenu()<CR>
  inoremap <C-w> <C-p>
  inoremap <C-s> <C-n>
endfunction

function! s:remap_fzf()
  nnoremap <C-f> :Files<CR>
  nnoremap <C-g> :GFiles<CR>
  command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --line-number --no-heading ' . shellescape(<q-args>),
        \   0,
        \   fzf#vim#with_preview(
        \     { 'options': '--exact --delimiter : --nth 3..' },
        \     'right:50%:wrap'
        \   )
        \ )
  nnoremap <C-r> :Rg<CR>
endfunction

call s:remap_vim()
call s:remap_shortcut()
call s:remap_surround()
call s:remap_completion()
call s:remap_fzf()

" GUI で出てくるクソみたいなウィンドウを抑制
if exists('g:GuiLoaded')
  GuiPopupmenu 0
  GuiTabline 0
endif

