return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'debugloop/telescope-undo.nvim',
    'polirritmico/telescope-lazy-plugins.nvim'
  },
  config = function()
    local telescope = require('telescope')
    telescope.setup({
      defaults = {
        sorting_strategy = 'ascending',
        layout_strategy = 'vertical',
        layout_config = {
          vertical = {
            width = 0.4,
            height = 0.7,
            mirror = true,
            prompt_position = 'top'
          }
        }
      },
      extensions = {
        lazy_plugins = {
          picker_opts = {
            layout_strategy = 'vertical'
          }
        }
      }
    })
    telescope.load_extension('undo')
    telescope.load_extension('lazy_plugins')
  end,
  keys = {
    { '<leader>ff', require('telescope.builtin').find_files, desc = 'Telescope find files' },
    { '<leader>fg', require('telescope.builtin').live_grep, desc = 'Telescope live grep' },
    { '<leader>fb', require('telescope.builtin').buffers, desc = 'Telescope buffers' },
    { '<leader>fh', require('telescope.builtin').help_tags, desc = 'Telescope help tags' }
  }
}
