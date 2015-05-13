" Python specific settings
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal smarttab
setlocal smartindent
setlocal foldmethod=marker

" Highlight a line past the 80th column
highlight OverLength ctermbg=darkred ctermfg=white guibg=#4D2D2D
match OverLength /\%>80v.\+/
