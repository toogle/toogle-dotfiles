" Python specific settings.
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal smarttab
setlocal formatoptions=croql

setlocal foldmethod=syntax

let python_highlight_all=1

" Highlight the 80th column.                                                    
if exists('+colorcolumn')                                                       
  set colorcolumn=80                                                            
endif
