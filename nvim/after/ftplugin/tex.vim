call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \ })

let b:endwise_addition = '\="\\end" . matchstr(submatch(0), "{.\\{-}}")'
let b:endwise_words = 'begin'
let b:endwise_pattern = '\\begin{.\{-}}'
let b:endwise_syngroups = 'texSection,texBeginEnd,texBeginEndName,texStatement'

inoremap <C-T> \texttt{}<Left>
nmap <F5> <Plug>(vimtex-compile)

