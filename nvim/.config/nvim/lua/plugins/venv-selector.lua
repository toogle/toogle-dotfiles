return {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    {
      'nvim-telescope/telescope.nvim',
      dependencies = {
        'nvim-lua/plenary.nvim'
      }
    }
  },
  branch = 'regexp',
  event = 'VeryLazy',
  lazy = false,
  opts = {},
  keys = {
    { '<leader>vs', '<cmd>VenvSelect<CR>', desc = 'Venv Selector' }
  }
}
