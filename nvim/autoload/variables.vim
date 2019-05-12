function! variables#set_variables()
  call variables#set_lsp_servers()
endfunction

function! variables#set_lsp_servers()
  let servers = {}
  let rls_toolchain = empty($RLS_TOOLCHAIN) ? 'beta' : $RLS_TOOLCHAIN

  let servers['rust'] = ['rustup', 'run', rls_toolchain, 'rls']
  let servers['c'] = ['ccls', '--log-file=/tmp/cc.log']
  let servers['cpp'] = ['ccls', '--log-file=/tmp/cc.log']

  let g:LanguageClient_serverCommands = servers
endfunction
