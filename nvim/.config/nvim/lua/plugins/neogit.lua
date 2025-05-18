return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim'
  },
  opts = {},
  cmd = 'Neogit',
  keys = {
    { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Neogit' },
    { '<leader>gc', '<cmd>Neogit commit<cr>', desc = 'Neogit commit' },
    { '<leader>gd', '<cmd>Neogit diff<cr>', desc = 'Neogit diff' },
    { '<leader>gl', '<cmd>Neogit log<cr>', desc = 'Neogit log' },
    { '<leader>gs', '<cmd>Neogit stash<cr>', desc = 'Neogit stash' }
  }
}
