return {
  'linux-cultist/venv-selector.nvim',
  commit = '6c1762d',
  event = 'VeryLazy',
  lazy = false,
  dependencies = {
    {
      'neovim/nvim-lspconfig',
      version = 'v2.5.0'
    },
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
