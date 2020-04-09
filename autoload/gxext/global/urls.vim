" Handle URLs without an explicit protocol.

let s:pattern = '^\([a-z0-9-]\+\.\)\+\([a-z]\+\)\(/.*\)\?$'

function! gxext#global#urls#open(line, mode)
  if a:line =~? s:pattern
    call netrw#BrowseX('https://' . a:line, 0)
    return 1
  endif
endfunction
