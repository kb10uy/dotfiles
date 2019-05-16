function! variables#set_variables()
  call variables#set_lsp_servers()
  call variables#set_vimtex()
  call variables#set_tus()
endfunction

function! variables#set_lsp_servers()
  let servers = {}
  let rls_toolchain = empty($RLS_TOOLCHAIN) ? 'beta' : $RLS_TOOLCHAIN

  let servers['rust'] = ['rustup', 'run', rls_toolchain, 'rls']
  let servers['c'] = ['ccls', '--log-file=/tmp/cc.log']
  let servers['cpp'] = ['ccls', '--log-file=/tmp/cc.log']

  let g:LanguageClient_serverCommands = servers
endfunction

function! variables#set_vimtex()
  let g:vimtex_compiler_progname = 'nvr'
  let g:tex_flavor = 'latex'
endfunction

function! variables#set_tus()
  if hostname() =~ '^tus'
    let g:python3_host_prog = '/usr/bin/python3.6'
  endif
endfunction
