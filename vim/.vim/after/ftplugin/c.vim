" C/C++ specific settings
setlocal tabstop=8
setlocal shiftwidth=8
setlocal expandtab
setlocal smarttab
setlocal cindent
setlocal cinoptions=:0
setlocal foldmethod=syntax

" Highlight a line past the 80th column
highlight OverLength ctermbg=darkred ctermfg=white guibg=#4D2D2D
match OverLength /\%>80v.\+/
