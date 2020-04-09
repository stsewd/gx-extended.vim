function! gxext#normal() abort
  call s:execute_modules(s:get_modules(), 'normal')
endfunction


function! gxext#visual() abort
  call s:execute_modules(s:get_modules(), 'visual')
endfunction


function! s:get_modules() abort
  return g:gxext#custom + g:gxext#load
endfunction


function! s:execute_modules(modules, mode) abort
  if a:mode ==# 'normal'
    let l:selection = expand('<cfile>')
  else
    let [l:linenr_start, l:colnr_start] = getpos("'<")[1:2]
    let [l:linenr_end, l:colnr_end] = getpos("'>")[1:2]
    let l:selection = getline(l:linenr_start)
    if l:linenr_start == l:linenr_end
      let l:selection = l:selection[l:colnr_start - 1:l:colnr_end - 1]
    endif
  endif

  for l:module in a:modules
    if !s:is_valid(l:module)
      continue
    endif

    try
      if gxext#{l:module}#open(l:selection, a:mode)
        return
      endif
      continue
    catch /E117/
      echoerr 'Unavaliable to find ' . 'gxext#' . l:module . '#open()'
    endtry
  endfor
endfunction


function! s:is_valid(module) abort
    let l:ftype = split(a:module, '#')[0]
    if l:ftype ==# 'global' || l:ftype ==# &filetype
      return 1
    endif
    return 0
endfunction
