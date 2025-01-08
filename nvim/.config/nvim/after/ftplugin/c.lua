-- C/C++ specific settings
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = false
vim.opt_local.smarttab = true
vim.opt_local.cindent = true
vim.opt_local.cinoptions = ':0'

-- Highlight a line past the 120th column
vim.api.nvim_set_hl(0, 'OverLength', { ctermbg = 'darkred', ctermfg = 'white', bg = 'darkred' })
vim.api.nvim_exec([[match OverLength /\%>120v.\+/]], false)
