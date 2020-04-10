" Handles Markdown links [link](https://google.com)

let s:pattern = '\[.\+\](\(.\+\))'

function! gxext#markdown#link#open(line, mode)
  let l:line = a:line
  if a:mode ==# 'normal'
    let l:line = getline('.')
    let l:col = col('.') - 1
    let l:line = gxext#matchstr_around(l:line, s:pattern, l:col)
  endif

  let l:match = matchlist(l:line, s:pattern)
  if empty(l:match)
    return 0
  endif

  return gxext#global#urls#open(l:match[1], 'visual')
endfunction
