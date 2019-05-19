function! plugin#setup_lsp() abort
  let rls_toolchain = empty($RLS_TOOLCHAIN) ? 'beta' : $RLS_TOOLCHAIN
  let pls_path = $HOME . '.config/composer/vendor/bin/php-language-server.php'

  let servers = {}
  let servers['rust'] = ['rustup', 'run', rls_toolchain, 'rls']
  let servers['c'] = ['ccls', '--log-file=/tmp/cc.log']
  let servers['cpp'] = ['ccls', '--log-file=/tmp/cc.log']
  let servers['typescript'] = ['javascript-typescript-stdio']
  let servers['php'] = ['php', pls_path]
  " let servers['tex'] = ['digestif']

  let g:LanguageClient_serverCommands = servers
  let g:LanguageClient_diagnosticsSignsMax = 2
  let g:LanguageClient_signatureHelpOnCompleteDone = 1
  set signcolumn=yes
endfunction

function! plugin#setup_completion() abort
  let g:deoplete#enable_at_startup = 1
endfunction

function! plugin#setup_tex() abort
  let g:vimtex_mappings_enabled = 0
  let g:vimtex_quickfix_open_on_warning = 0
  let g:vimtex_compiler_latexmk = {
        \   'background': 1,
        \   'continuous': 1,
        \   'backend': 'nvim',
        \ }
endfunction
