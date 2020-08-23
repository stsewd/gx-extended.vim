" Handles 'Text #xxx' to open the PR/issue on GitHub

const s:pattern = '\(\w\+\s\+\)\?#\([0-9]\+\)'

function! gxext#gitcommit#github#open(line, mode)
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

  let l:id = l:match[2]

  let l:repo_url = s:get_repo_url()
  if empty(l:repo_url)
    return 0
  endif

  let l:url = l:repo_url . '/issues/' . l:id
  call gxext#browse(l:url)
  return 1
endfunction


" Try to get the URL from the repository using 'hub' or using fugitive.
function! s:get_repo_url()
  if g:gxext#dryrun
    return 'https://github.com/stsewd/sphinx.nvim'
  endif

  let l:hub = 'hub'
  if executable(l:hub)
    let l:repo = system(l:hub . ' browse -u')
    let l:repo = substitute(l:repo, '\n', '', 'g')
    return l:repo
  endif

  if exists('*FugitiveRemoteUrl')
    let l:remote = FugitiveRemoteUrl()
    let l:pattern_ssh = '^git@\([a-z0-9_.-]\+\):\([a-z0-9_.-]\+/[a-z0-9_.-]\+\)$'
    let l:match = matchlist(l:remote, l:pattern_ssh)
    if !empty(l:match)
      let l:domain = l:match[1]
      let l:name = l:match[2]
      return 'https://' . l:domain . '/' . l:name
    endif
    return l:remote
  endif
  return ''
endfunction
