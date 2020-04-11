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

let g:gxext#debug = get(g:, 'gxext#debug', 0)
let g:gxext#dryrun = get(g:, 'gxext#dryrun', 0)
let g:gxext#custom_handlers = get(g:, 'gxext#custom_handlers', {})
let g:gxext#handlers = get(g:, 'gxext#handlers', {
      \ 'global': ['global#urls', 'global#gx'],
      \ 'gitcommit': ['gitcommit#github'],
      \ 'markdown': ['markdown#link'],
      \ 'vim': ['vim#plugin'],
      \})

let g:loaded_gxext = 1
