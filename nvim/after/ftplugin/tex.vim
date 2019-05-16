call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \ })

inoremap <C-T> \texttt{}<Left>
