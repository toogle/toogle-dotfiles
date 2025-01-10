return {
  'linux-cultist/venv-selector.nvim',
  branch = 'regexp',
  event = 'VeryLazy',
  lazy = false,
  dependencies = {
    'neovim/nvim-lspconfig',
    {
      'nvim-telescope/telescope.nvim',
      dependencies = {
        'nvim-lua/plenary.nvim'
      }
    }
  },
  opts = {},
  keys = {
    { '<leader>vs', '<cmd>VenvSelect<CR>', desc = 'Venv Selector' }
  }
}
