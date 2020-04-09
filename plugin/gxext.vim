if exists('g:loaded_gxext')
  finish
endif

nnoremap <unique><silent> <Plug>(gxext-normal) :call gxext#normal()<CR>
vnoremap <unique><silent> <Plug>(gxext-visual) :<C-U>call gxext#visual()<CR>

if maparg('gx','n') == '' && !hasmapto('<Plug>(gxext-normal)')
  nmap gx <Plug>(gxext-normal)
endif
if maparg('gx', 'v') == '' && !hasmapto('<Plug>(gxext-visual)')
  vmap gx <Plug>(gxext-visual)
endif

let g:gxext#custom = get(g:, 'gxext#custom', [])
let g:gxext#load = get(g:, 'gxext#load', [
      \ 'vim#plugin',
      \ 'global#urls',
      \ 'global#gx',
      \])

let g:loaded_gxext = 1
