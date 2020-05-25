" Handles URLs with/without an explicit protocol.

let s:pattern =
      \ '^\(https\?://[a-z0-9].*\)$' ..
      \ '\|^\([a-z0-9-]\+:[0-9]\+\(/.*\)\?\)$' ..
      \ '\|^\(\([a-z0-9-]\+\)\(\.[a-z0-9-]\+\)\+\(:[0-9]\+\)\?\(/.*\)\?\)$'


function! gxext#global#urls#open(line, mode)
  let l:match = matchlist(a:line, s:pattern)
  if empty(l:match)
    return 0
  endif

  let l:url = l:match[0]
  if l:url !~? '^https\?://'
    let l:url = 'https://' . l:match[0]
  endif
  call gxext#browse(l:url)
  return 1
endfunction
