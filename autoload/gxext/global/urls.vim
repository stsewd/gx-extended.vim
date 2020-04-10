" Handles URLs with/without an explicit protocol.

let s:pattern = '^\(https\?://\)\?\([a-z0-9-]\+\.\)\+\([a-z]\+\)\(/.*\)\?$'

function! gxext#global#urls#open(line, mode)
  let l:match = matchlist(a:line, s:pattern)
  if empty(l:match)
    return 0
  endif

  let l:url = l:match[0]
  if empty(l:match[1])
    let l:url = 'https://' . l:match[0]
  endif
  call netrw#BrowseX(l:url, 0)
  return 1
endfunction
