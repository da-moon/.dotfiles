
" \ ['hashivim/vim-hashicorp-tools'],
function! before#spacevim#plugins#bootstrap()
  call SpaceVim#logger#info("[ before#spacevim#plugins#bootstrap ] function called.")
  if executable('shfmt')
    call SpaceVim#logger#info("[ before#spacevim#plugins#bootstrap ] 'shfmt' binary detected. Adding associated vim plugin")
    call add(g:spacevim_custom_plugins,['z0mbix/vim-shfmt',{ 'on_ft': 'sh' }])
  end
  if executable('just')
    call SpaceVim#logger#info("[ before#spacevim#plugins#bootstrap ] 'just' binary detected. Adding associated vim plugin")
    call add(g:spacevim_custom_plugins,['vmchale/just-vim',{ 'on_ft': 'justfile' }])
  end
endfunction
