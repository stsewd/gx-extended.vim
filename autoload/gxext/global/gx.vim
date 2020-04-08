" Replicates the behavior from the original `gx` mapping

function! gxext#global#gx#open(line, mode)
  " Default to original gx
  if a:mode ==# 'normal'
    " https://github.com/neovim/neovim/blob/6ca7ebb34685a2be497dd5bb00defd5976af7b27/runtime/plugin/netrwPlugin.vim#L84
    call netrw#BrowseX(expand(get(g:, 'netrw_gx', '<cfile>')), netrw#CheckIfRemote())
  else
    " https://github.com/neovim/neovim/blob/6ca7ebb34685a2be497dd5bb00defd5976af7b27/runtime/plugin/netrwPlugin.vim#L90
    call netrw#BrowseXVis()
  endif
  return 1
endfunction
