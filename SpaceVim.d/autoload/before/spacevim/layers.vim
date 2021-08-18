function! before#spacevim#layers#autocomplete()
  call SpaceVim#logger#info("[ before#spacevim#layers#autocomplete ] function called.")
  " let g:spacevim_autocomplete_method = "coc"
  " let g:spacevim_auto_completion_return_key_behavior = "complete"
  " let g:spacevim_auto_completion_tab_key_behavior = "smart"

    call SpaceVim#layers#autocomplete#set_variable({
      \ 'autocomplete_method' : 'coc',
      \ 'auto_completion_return_key_behavior' : 'complete',
      \ 'auto_completion_tab_key_behavior':'smart' ,
  \ })

endfunction
function! before#spacevim#layers#gtags()
  call SpaceVim#logger#info("[ before#spacevim#layers#gtags ] function called.")
  " let g:spacevim_gtagslabel = "ctags"
  call SpaceVim#layers#gtags#set_variable({
      \ 'gtagslabel' : 'ctags',
  \ })

endfunction
function! before#spacevim#layers#format()
  call SpaceVim#logger#info("[ before#spacevim#layers#format ] function called.")
  " let g:spacevim_format_on_save = "true"
    call SpaceVim#layers#format#set_variable({
      \ 'format_on_save' : 'true',
  \ })
endfunction
function! before#spacevim#layers#shell()
  call SpaceVim#logger#info("[ before#spacevim#layers#shell ] function called.")
  " call add(g:spacevim_layers,'shell')
  call SpaceVim#layers#shell#set_variable({
      \ 'default_position' : 'bottom',
      \ 'spacevim_default_height' : 20,
  \ })

endfunction
function! before#spacevim#layers#checkers()
  call SpaceVim#logger#info("[ before#spacevim#layers#checkers ] function called.")
  " call SpaceVim#layers#load('checkers')
  " let g:spacevim_lint_on_save="true"
  " let g:spacevim_show_cursor_error="false"
  call SpaceVim#layers#shell#set_variable({
      \ 'lint_on_save' : 'true',
      \ 'show_cursor_error' : 'false',
  \ })
endfunction
function! before#spacevim#layers#lsp()
  call SpaceVim#logger#info("[ before#spacevim#layers#lsp ] function called.")
  let lsp_servers = {
              \ 'dockerfile' : 'docker-langserver',
              \ 'sh' : 'bash-language-server',
              \ }

  let filetypes = []
  for lang in keys(lsp_servers)
      if executable(lsp_servers[lang])
          call add(filetypes, lang)
      endif
  endfor
  call SpaceVim#layers#lsp#set_variable({
  \ 'filetypes' : filetypes,
  \ })
endfunction
function! before#spacevim#layers#bootstrap()
  call SpaceVim#logger#info("[ before#spacevim#layers#bootstrap ] function called.")
  for layer in g:spacevim_layers
    call SpaceVim#logger#info("[ before#spacevim#layers#bootstrap ] loading ****'" . layer . "' spacevim layer")
    call SpaceVim#layers#load(layer)
  endfor
  call before#spacevim#layers#autocomplete()
  call before#spacevim#layers#format()
  call before#spacevim#layers#shell()
  call before#spacevim#layers#checkers()
  call before#spacevim#layers#lsp()
endfunction
