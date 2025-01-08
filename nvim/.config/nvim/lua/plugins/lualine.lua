return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  opts = {
    options = {
      theme = 'nord',
      disabled_filetypes = {
        statusline = {
          'Avante',
          'AvanteInput',
          'alpha',
          'neo-tree',
          'toggleterm',
          'trouble'
        }
      }
    },
    sections = {
      lualine_c = {
        {
          'buffers',
          mode = 4  -- shows buffer name + buffer number
        }
      }
    }
  }
}
