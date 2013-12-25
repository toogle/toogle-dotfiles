" Python specific settings
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal smarttab
setlocal smartindent
setlocal formatoptions=croql
setlocal foldmethod=syntax

let python_highlight_all = 1

" Highlight a line past the 80th column
highlight OverLength ctermbg=darkred ctermfg=white guibg=#4D2D2D
match OverLength /\%>80v.\+/
