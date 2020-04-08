" Handle URLs without an explicit protocol.

let s:url_pattern = '^\([a-z0-9-]\+\.\)\+\([a-z]\+\)\(/.*\)\?$'

function! gxext#global#urls#open(line, mode)
  if a:line =~? s:url_pattern
    call netrw#BrowseX('https://' . a:line, 0)
    return 1
  endif
endfunction
