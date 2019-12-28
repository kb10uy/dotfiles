augroup ncm2_vimtex_setup
  autocmd!
  autocmd FileType tex call ncm2#register_source({
          \ 'name': 'vimtex',
          \ 'priority': 8,
          \ 'scope': ['tex'],
          \ 'mark': 'tex',
          \ 'word_pattern': '\w+',
          \ 'complete_pattern': 'g:vimtex#re#ncm2',
          \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
          \ })
augroup END

inoremap <C-T> \texttt{}<Left>
nmap <F5> <Plug>(vimtex-compile)

