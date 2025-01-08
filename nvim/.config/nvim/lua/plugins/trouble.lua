return {
  'folke/trouble.nvim',
  opts = {
    auto_close = true  -- automatically close when empty
  },
  cmd = 'Trouble',
  keys = {
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle filter.buf=0<CR>',
      desc = 'Buffer Diagnostics (Trouble)'
    },
    {
      '<leader>xX',
      '<cmd>Trouble diagnostics toggle<CR>',
      desc = 'Diagnostics (Trouble)'
    },
    {
      '<leader>cs',
      '<cmd>Trouble symbols toggle focus=false<CR>',
      desc = 'Symbols (Trouble)'
    },
    {
      '<leader>cl',
      '<cmd>Trouble lsp toggle focus=false win.position=right<CR>',
      desc = 'LSP Definitions / references / ... (Trouble)'
    },
    {
      '<leader>xL',
      '<cmd>Trouble loclist toggle<CR>',
      desc = 'Location List (Trouble)'
    },
    {
      '<leader>xQ',
      '<cmd>Trouble qflist toggle<CR>',
      desc = 'Quickfix List (Trouble)'
    }
  }
}
