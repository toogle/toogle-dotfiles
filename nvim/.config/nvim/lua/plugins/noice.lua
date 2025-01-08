return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify'
  },
  opts = {
    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true
      }
    },
    presets = {
      bottom_search = true,          -- use a classic bottom cmdline for search
      command_palette = true,        -- position the cmdline and popupmenu together
      long_message_to_split = true,  -- long messages will be sent to a split
      lsp_doc_border = false         -- add a border to hover docs and signature help
    }
  },
  keys = {
    {
      '<leader>nl',
      function()
        require('noice').cmd('last')
      end,
      desc = 'Noice Last Popup'
    },
    {
      '<leader>nt',
      function()
        require('noice').cmd('telescope')
      end,
      desc = 'Noice Telescope'
    }
  }
}
