function! before#spacevim#docker#bootstrap()
  call SpaceVim#logger#info("[ before#spacevim#docker#bootstrap ] function called.")
  if executable('docker')
    call SpaceVim#logger#info("[ before#spacevim#docker#bootstrap ] docker detected.adding associated plugins and configuration.")
    call add(g:coc_extensions,'coc-docker')
    call SpaceVim#logger#info("[ before#spacevim#docker#bootstrap ] loading 'lang#dockerfile' spacevim layer")
    call add(g:spacevim_layers,'lang#dockerfile')
  end
endfunction
