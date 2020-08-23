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

if has('mac')
  let s:opencmd = 'open'
elseif has('unix')
  let s:opencmd = 'xdg-open'
else
  let s:opencmd = 'gx'
endif
let g:gxext#opencmd = get(g:, 'gxext#opencmd', s:opencmd)

let g:gxext#handlers = get(g:, 'gxext#handlers', gxext#find_handlers())

let g:loaded_gxext = 1
