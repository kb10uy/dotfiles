function! kb10uy#plugin#setup_lsp() abort
  if !empty($NVIM_DISABLE_LSP)
    return
  endif

  let rls_toolchain = empty($RLS_TOOLCHAIN) ? 'beta' : $RLS_TOOLCHAIN
  let pls_path = $HOME . '/.config/composer/vendor/bin/php-language-server.php'

  let servers = {}
  let servers['typescript'] = ['typescript-language-server', '--stdio']
  let servers['javascript'] = ['javascript-typescript-stdio']
  let servers['python'] = ['pyls']
  let servers['php'] = ['php', pls_path]
  let servers['rust'] = ['rustup', 'run', rls_toolchain, 'rls']
  " let servers['rust'] = ['ra_lsp_server']
  let servers['c'] = ['clangd']
  let servers['cpp'] = ['clangd']
  " let servers['haskell'] = ['hie-wrapper', '--lsp']
  " let servers['tex'] = ['digestif']

  let g:LanguageClient_serverCommands = servers
  let g:LanguageClient_diagnosticsSignsMax = 2
  " これら呼ぶと破滅するので NG
  " let g:LanguageClient_completionPreferTextEdit = 1
  " let g:LanguageClient_signatureHelpOnCompleteDone = 1
endfunction

function! kb10uy#plugin#setup_completion() abort
  inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
  autocmd BufEnter * call ncm2#enable_for_buffer()
  set completeopt=noinsert,menuone,noselect
endfunction

function! kb10uy#plugin#setup_tex() abort
  let g:vimtex_mappings_enabled = 0
  let g:vimtex_quickfix_open_on_warning = 0
  let g:vimtex_compiler_latexmk = {
        \   'background': 1,
        \   'continuous': 1,
        \   'backend': 'nvim',
        \ }
  augroup ncm2_vimtex_setup
    autocmd FileType tex call ncm2#register_source({
            \ 'name': 'vimtex-cmds',
            \ 'priority': 8,
            \ 'complete_length': -1,
            \ 'scope': ['tex'],
            \ 'matcher': {'name': 'prefix', 'key': 'word'},
            \ 'word_pattern': '\w+',
            \ 'complete_pattern': 'g:vimtex#re#ncm2#cmds',
            \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
            \ })
  augroup END
endfunction
