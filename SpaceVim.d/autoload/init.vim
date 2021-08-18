let g:spacevim_custom_plugins = [
  \ ['jvirtanen/vim-hcl',{ 'on_ft' : 'hcl'}],
  \ ['neoclide/coc.nvim'],
  \ ['mg979/vim-visual-multi'],
  \ ['will133/vim-dirdiff'],
  \ ['tarekbecker/vim-yaml-formatter'],
  \ ['machakann/vim-highlightedyank'],
  \ ['sheerun/vim-polyglot'],
\ ]
let g:spacevim_layers=[
  \ 'shell',
  \ 'colorscheme',
  \ 'tools',
  \ 'ctrlspace',
  \ 'ui',
  \ 'git',
  \ 'github',
  \ 'foldsearch',
  \ 'checkers',
  \ 'format',
  \ 'gtags',
  \ 'autocomplete',
  \ 'core#statusline',
  \ 'lang#extra',
  \ 'lang#vim',
  \ 'lang#markdown',
  \ 'lang#toml',
  \ 'lang#json',
  \ 'lang#yaml',
  \ 'lang#python',
  \ 'lsp',
\]
if executable('sudo')
  call add(g:spacevim_layers,'sudo')
end
if executable('fzf')
  call add(g:spacevim_layers,'fzf')
end
if executable('sh')
  call add(g:spacevim_layers,'lang#sh')
end
if executable('ruby')
  call add(g:spacevim_layers,'lang#ruby')
end

function! init#before() abort
  call SpaceVim#logger#info("[ init#before ] function called")

  call before#coc#common#bootstrap()
  call before#coc#list#bootstrap()
  call before#coc#json#bootstrap()

  call before#spacevim#generic#bootstrap()
  call before#spacevim#nvim#bootstrap()
  call before#spacevim#mapping#bootstrap()
  call before#spacevim#tasks#bootstrap()
  call before#spacevim#linter#bootstrap()
  call before#spacevim#xclip#bootstrap()
  call before#spacevim#themes#bootstrap()
  
  call before#spacevim#golang#bootstrap()
  call before#spacevim#docker#bootstrap()
  
  call before#spacevim#layers#bootstrap()
  call before#spacevim#plugins#bootstrap()
endfunction
function! init#after() abort
  call SpaceVim#logger#info("[ init#after ] function called")
  call after#coc#install#bootstrap()
  set showcmd
  nnoremap <silent> [Window]a :cclose<CR>:lclose<CR>
endfunction
