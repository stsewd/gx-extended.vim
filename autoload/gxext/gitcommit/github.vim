" Handle #xxx to open the PR/issue on GitHub

let s:pattern = '#\([0-9]\+\)'

function! gxext#gitcommit#github#open(line, mode)
  let l:line = a:line

  if a:mode ==# 'normal'
    let l:line = getline('.')
    let l:pos = getpos('.')[2] - 1
    let l:line = gxext#matchstr_around(l:line, s:pattern, l:pos)
  endif

  let l:match = matchlist(l:line, s:pattern)
  if empty(l:match)
    return 0
  endif

  let l:id = l:match[1]
  let l:user = 'stsewd'
  let l:repo = 'gx-extended.vim'
  let l:url = 'https://github.com/stsewd/' . l:user . '/' . l:repo . '/issues/' . l:id
  call netrw#BrowseX(l:url, 0)
  return 1
endfunction
