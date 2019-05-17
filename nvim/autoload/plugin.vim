function! plugin#setup_lsp() abort
  let rls_toolchain = empty($RLS_TOOLCHAIN) ? 'beta' : $RLS_TOOLCHAIN

  let servers = {}
  let servers['rust'] = ['rustup', 'run', rls_toolchain, 'rls']
  let servers['c'] = ['ccls', '--log-file=/tmp/cc.log']
  let servers['cpp'] = ['ccls', '--log-file=/tmp/cc.log']

  let g:LanguageClient_serverCommands = servers
  let g:LanguageClient_diagnosticsSignsMax = 2
  set signcolumn=yes
endfunction

function! plugin#setup_completion() abort
  let g:deoplete#enable_at_startup = 1
endfunction
