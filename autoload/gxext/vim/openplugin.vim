" Handle Plug 'user/repo' to open the GitHub repo.

let s:pattern = 'Plug\s\+''\([a-zA-Z0-9_.-]\+/[a-zA-Z0-9_.-]\+\)'''

function! gxext#vim#openplugin#open(...)
  let l:line = getline('.')
  let l:match = matchlist(l:line, s:pattern)
  if !empty(l:match)
    call netrw#BrowseX('https://github.com/' . l:match[1], 0)
    return 1
  endif
endfunction
