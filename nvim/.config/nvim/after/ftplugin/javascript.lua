-- JavaScript specific settings
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = true
vim.opt_local.smarttab = true
vim.opt_local.smartindent = true

-- Highlight a line past the 120th column
vim.api.nvim_set_hl(0, 'OverLength', { ctermbg = 'darkred', ctermfg = 'white', bg = 'darkred' })
vim.api.nvim_exec([[match OverLength /\%>120v.\+/]], false)
