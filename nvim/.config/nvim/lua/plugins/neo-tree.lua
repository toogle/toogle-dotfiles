return {
  'nvim-neo-tree/neo-tree.nvim',
  lazy = false,  -- to use as netrw replacement
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim'
  },
  opts = {
    close_if_last_window = true,
    window = {
      width = 30
    },
    filesystem = {
      filtered_items = {
        hide_by_name = {
          'node_modules',
          'venv',
          '__pycache__'
        },
        always_show = {
          '.gitignore'
        },
        always_show_by_pattern = {
          '.env*'
        },
        never_show = {
          '.DS_Store'
        }
      },
      follow_current_file = {
        enabled = true
      },
      hijack_netrw_behavior = 'open_current',
      use_libuv_file_watcher = true
    }
  },
  keys = {
    { '<leader>ft', '<cmd>Neotree toggle<CR>', desc = 'NeoTree' }
  }
}
